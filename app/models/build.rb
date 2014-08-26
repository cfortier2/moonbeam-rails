# == Schema Information
#
# Table name: builds
#
#  id             :integer          not null, primary key
#  finished_at    :datetime
#  user_id        :integer
#  environment_id :integer
#  sha            :string(255)
#  successful     :boolean
#  created_at     :datetime
#  updated_at     :datetime
#
# Indexes
#
#  index_builds_on_environment_id  (environment_id)
#  index_builds_on_user_id         (user_id)
#

class Build < ActiveRecord::Base
  belongs_to :user
  belongs_to :environment

  scope :pending, -> { where(finished_at: nil) }
  scope :finished, -> { where.not(finished_at: nil) }

  def self.current
    pending.first
  end

  def short_sha
    sha[0...7]
  end
end
