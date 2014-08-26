class BuildQueueController < ApplicationController
  def join
    message = enqueuer.enqueue(current_user)
    flash[message[:type]] = message[:content]
    redirect_to root_path
  end

  def jump
    enqueuer.enqueue(current_user, emergency: true)
    flash[message[:type]] = message[:content]
    redirect_to root_path
  end

  private

  def enqueuer
    BuildEnqueuer.new
  end
end
