class BuildEnqueuer
  def enqueue(user, emergency: false)
    if active_control_session?
      BuildRequest.create(user: user, emergency: emergency)
    else
      BuildRequest.create(user: user,
                          emergency: emergency,
                          given_control_at: Time.now)
      ControlSession.create(user: user)
    end
  end

  private

  def active_control_session?
    !ControlSession.current.nil?
  end
end
