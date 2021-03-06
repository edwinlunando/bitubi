# Global helper
module ApplicationHelper
  def number_format(number)
    ActionController::Base.helpers.number_to_currency(number, unit: 'IDR', delimiter: '.', precision: 0, format: '%u %n')
  end

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def bootstrap_class_for(flash_type)
    # to accomodate rails flash type into bootstrap
    case flash_type
    when 'success'
      'alert-success'
    when 'error'
      'alert-danger'
    when 'alert'
      'alert-warning'
    when 'notice'
      'alert-info'
    else
      flash_type.to_s
    end
  end

end
