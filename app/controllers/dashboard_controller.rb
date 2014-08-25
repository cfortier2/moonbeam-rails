class DashboardController < ApplicationController
  def index
    @builds = []

    @active_request = BuildRequest.active_weighted
    @build_queue = BuildRequest.pending_weighted
  end
end
