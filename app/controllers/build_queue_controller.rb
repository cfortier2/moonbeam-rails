class BuildQueueController < ApplicationController
  def join
    enqueuer.enqueue(current_user)
    flash[:success] = "Joined the Build Queue"
    redirect_to root_path
  end

  def jump
    enqueuer.enqueue(current_user, emergency: true)
    flash[:success] = "Jumped the Build Queue"
    redirect_to root_path
  end

  private

  def enqueuer
    BuildEnqueuer.new
  end
end
