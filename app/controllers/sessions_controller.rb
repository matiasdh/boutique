class SessionsController < Devise::SessionsController
  layout 'modal'
  def create
    if request.xhr?
      resource = warden.authenticate!(:scope => resource_name, :recall => "#{controller_path}#failure")
      sign_in_and_redirect(resource_name, resource)
    else
      super
    end
  end

  def new
    self.resource = resource_class.new(sign_in_params)
    clean_up_passwords(resource)
    unless request.xhr?
      respond_with(resource, serialize_options(resource), :layout => 'application')
    else
      respond_with(resource, serialize_options(resource))
    end
  end
 
  def sign_in_and_redirect(resource_or_scope, resource=nil)
    scope = Devise::Mapping.find_scope!(resource_or_scope)
    resource ||= resource_or_scope
    sign_in(scope, resource) unless warden.user(scope) == resource
    return render "create"
  end
 
  def failure
    return render "failure"
  end
end