class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  protected
    
  def configure_sing_up_params
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  private

  def respond_with(resource, _opts = {})
    resource.persisted? ? register_success : register_failed
  end

  def register_success
    render json: { message: 'Registrado!' }
  end

  def register_failed
    render json: { message: "Registro Falhou !!!" }
  end
  
end
