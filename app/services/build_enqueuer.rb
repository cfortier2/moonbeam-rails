class BuildEnqueuer
  def enqueue(user, emergency: false)
    message = { type: :success }

    if active_control_session?
      BuildRequest.create(user: user, emergency: emergency)
      message[:content] = "Successfully added to Build Queue"
    else
      BuildRequest.create(user: user,
                          emergency: emergency,
                          given_control_at: Time.now)
      ControlSession.create(user: user)
      message[:content] = "Build Queue is empty; Assuming direct control"
    end

    message
  end

  private

  def active_control_session?
    !ControlSession.current.nil?
  end
end
