class PullsController < ApplicationController
  before_filter :block_unless_controlling

  def index
    @pull_requests = GithubApi.new(session[:github_token]).open_prs
  end

  def merge
    # TODO: This actually needs to like...merge and stuff
    flash[:success] = "Successfully merged PR ##{pr_link(pull_params[:pull_request_number])}"
    redirect_to pulls_path
  end

  private

  def pull_params
    params.permit(:pull_request_number)
  end

  def pr_link(number)
    "<a href=\"https://github.com/behance/be.net/pull/#{number}\" target=\"_blank\">#{number}</a>"
  end
end
