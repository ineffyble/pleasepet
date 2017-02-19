class RegistrationsController < Devise::RegistrationsController
  def new
    build_resource({})
    resource.build_page
    respond_with resource
  end

  private

  def sign_up_params
    allow = [:name, :email, :password, :password_confirmation, :cpf, [page_attributes: [:url]]]
    params.require(resource_name).permit(allow)
  end

  def account_update_params
    allow = [:name, :cpf, :email, :password, :password_confirmation, :current_password]
    params.require(resource_name).permit(allow)
  end

  def after_sign_up_path_for(resource)
     edit_page_url(url: current_pet.page.url)
  end
end
