module Util
  BASE_URL = 'https://api.github.com/'

  def load_lazing_attrs(params)
    params.each do |attr, value|
      unless ['forks', 'followers', 'following', 'public_repos'].include? attr
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
end
