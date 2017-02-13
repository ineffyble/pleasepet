class RegistrationsController < Devise::RegistrationsController

  def new
    build_resource({})
    resource.build_page
    respond_with self.resource
  end

  private
  def sign_up_params
    allow = [:name, :email, :password, :password_confirmation, :cpf, [page_attributes: [:url]]]
    params.require(resource_name).permit(allow)
  end

end
