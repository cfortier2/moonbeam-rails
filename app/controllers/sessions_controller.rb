class SessionsController < ApplicationController
  skip_before_filter :authenticate, only: [:new, :create]

  def new
  end

  def create
    if allowed_team_member?
      create_session
    else
      flash[:error] = "You do no have permission to view this content"
    end

    redirect_to root_path
  end

  def destroy
    destroy_session
    redirect_to root_path
  end

  private

  def create_session
    user = User.where(username: github_username).first_or_create
    user.update_attributes(extract_from_auth_hash)

    session[:github_token] = github_token
    session[:remember_token] = user.remember_token
  end

  def destroy_session
    session[:remember_token] = nil
  end

  def allowed_team_member?
    client = Octokit::Client.new(access_token: github_token)
    client.orgs.any? { |org| org.login == ENV["ALLOWED_TEAM"] }
  end

  def github_username
    env["omniauth.auth"]["info"]["nickname"]
  end

  def github_token
    env["omniauth.auth"]["credentials"]["token"]
  end

  def extract_from_auth_hash
    info = env["omniauth.auth"]["info"]

    {
      email: info["email"],
      name: info["name"],
      avatar: info["image"]
    }
  end
end
