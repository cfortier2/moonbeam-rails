class PullsController < ApplicationController
  def index
    @pull_requests = GithubApi.new(session[:github_token]).open_prs
  end

  def merge
    puts pull_params
    redirect_to root_path
  end

  private

  def pull_params
    params.permit(:pull_request_number)
  end
end
