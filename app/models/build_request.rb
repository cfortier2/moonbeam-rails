# == Schema Information
#
# Table name: build_requests
#
#  id               :integer          not null, primary key
#  user_id          :integer
#  emergency        :boolean
#  created_at       :datetime
#  updated_at       :datetime
#  given_control_at :datetime
#
# Indexes
#
#  index_build_requests_on_user_id  (user_id)
#

class BuildRequest < ActiveRecord::Base
  belongs_to :user

  scope :pending, -> { where(given_control_at: nil) }
  scope :weighted, -> { pending.order(emergency: :desc, created_at: :asc)}
end
