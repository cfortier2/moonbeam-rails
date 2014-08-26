class DashboardController < ApplicationController
  def index
    @active_build = Build.current
    @recent_builds = Build.finished

    @active_request = ControlSession.current
    @build_queue = BuildRequest.weighted
  end
end
