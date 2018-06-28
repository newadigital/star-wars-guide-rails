class ApplicationModel
  include ApplicationHelper

  def initialize(hash)
    hash.each do |k,v|
      self.instance_variable_set("@#{k}", v.is_a?(Hash) ? Hashit.new(v) : v)
      self.class.send(:define_method, k, proc{self.instance_variable_get("@#{k}")})
      self.class.send(:define_method, "#{k}=", proc{|v| self.instance_variable_set("@#{k}", v)})
    end
  end

  def image
    format_image_url(self.section, self.name)
  end
  
  def image_url
    _image = format_image_url(self.section, self.name)
    if Rails.application.assets.resolve(_image).present? 
      return _image
    else
      return ActionController::Base.helpers.asset_path('default-image.jpg')
    end
  end

  :id
  :name
  :section
  # :created
  # :edited

end
