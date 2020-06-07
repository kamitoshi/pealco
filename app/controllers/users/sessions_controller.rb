# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  layout "no_header"
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    super
    cookies.encrypted[:user_id] = resource.id
  end

  # DELETE /resource/sign_out
  def destroy
    super
    cookies.encrypted[:user_id] = nil
  end

  protect_from_forgery with: :exception

  protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  # The path used after sign in.
  def after_sign_in_path_for(resource)
    posts_path
  end

  # The path used after sign out.
  def after_sign_out_path_for(resource)
    root_path
  end
end
