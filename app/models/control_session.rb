# == Schema Information
#
# Table name: control_sessions
#
#  id          :integer          not null, primary key
#  finished_at :datetime
#  user_id     :integer
#  created_at  :datetime
#  updated_at  :datetime
#
# Indexes
#
#  index_control_sessions_on_user_id  (user_id)
#

class ControlSession < ActiveRecord::Base
  belongs_to :user

  scope :active, -> { where(finished_at: nil).limit(1) }

  def self.current
    active.first
  end

  def self.controlling_user
    current.user unless current.nil?
  end
end
