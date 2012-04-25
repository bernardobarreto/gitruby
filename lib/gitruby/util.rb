module Util
  BASE_URL = 'https://api.github.com/'

  def load_lazing_attrs(params)
    params.each do |attr, value|
      methods = ['forks', 'public_repos']
      # github api doesn't support get org's followers/following
      methods << ['followers', 'following'] unless self.is_a? Org

      unless methods.flatten.include? attr
        if !!value == value
          self.singleton_class.send(:attr_writer, attr)
          self.singleton_class.send(:define_method, "#{attr}?") do
            instance_variable_get("@#{attr}")
          end
        else
          self.singleton_class.send(:attr_accessor, attr)
        end
        send("#{attr}=", value)
      end
    end
  end

  def format_options(options=nil)
    options = '?' + options.map {|k, v| "%s=%s" % [k, v] }.join("&") if options
    options || ''
  end
end
