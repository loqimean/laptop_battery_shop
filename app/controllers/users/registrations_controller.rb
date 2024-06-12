# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]

  protected

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:email, :password, :first_name, :last_name, :address, :phone)
    end
  end

  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:email, :password, :first_name, :last_name, :address, :phone, :current_password)
    end
  end

  private

  def update_resource(resource, params)
    if params[:current_password].nil?
      resource.update_without_password(params)
    else
      super
    end
  end
end
