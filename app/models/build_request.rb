class BuildRequest < ActiveRecord::Base
  belongs_to :user

  scope :pending, -> { where(finished_at: nil) }
  scope :weighted, -> { pending.order(emergency: :desc, created_at: :asc)}

  def self.active_weighted
    weighted[0]
  end

  def self.pending_weighted
    weighted[1..-1]
  end
end
