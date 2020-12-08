# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  protect_from_forgery
  before_action :authenticate_user!
  before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    super
    if user_signed_in?
    redirect_to '/dashboard'
    else
      redirect_to new_users_session_path
  end

  # DELETE /resource/sign_out
  def destroy
    super
    destroy_user_session
    redirect_to root
  end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  end
end
