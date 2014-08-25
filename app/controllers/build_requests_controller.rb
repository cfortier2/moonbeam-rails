class BuildRequestsController < ApplicationController
  def join
    BuildRequest.create(user: current_user, emergency: false)
    redirect_to root_path
  end

  def jump
    BuildRequest.create(user: current_user, emergency: true)
    redirect_to root_path
  end
end
