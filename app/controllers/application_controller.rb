class ApplicationController < ActionController::Base
  before_filter :authenticate
  protect_from_forgery with: :exception

  helper_method :signed_in?, :controlling_user?, :current_user, :deployed_sha

  def deployed_sha
    @current_deployed_sha ||= Behance.current_sha
  end

  def authenticate
    unless signed_in?
      redirect_to login_path
    end
  end

  def block_unless_controlling
    unless controlling_user?
      flash[:warning] = "Only the current acting user has access to that page"
      redirect_to root_path
    end
  end

  def controlling_user?
    pp controlling_user
    current_user == controlling_user
  end

  def signed_in?
    current_user.present?
  end

  def current_user
    @current_user ||= User.where(remember_token: session[:remember_token]).first
  end

  def controlling_user
    @controlling_user ||= ControlSession.controlling_user
  end
end
