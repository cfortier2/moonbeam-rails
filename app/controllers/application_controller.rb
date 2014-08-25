class ApplicationController < ActionController::Base
  before_filter :authenticate
  protect_from_forgery with: :exception

  helper_method :signed_in?, :current_user, :deployed_sha

  def deployed_sha
    @current_deployed_sha ||= Behance.current_sha
  end

  def authenticate
    unless signed_in?
      redirect_to login_path
    end
  end

  def signed_in?
    current_user.present?
  end

  def current_user
    @current_user ||= User.where(remember_token: session[:remember_token]).first
  end
end
