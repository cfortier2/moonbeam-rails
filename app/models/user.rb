class User < ActiveRecord::Base
  before_create :generate_remember_token

  has_many :build_requests, dependent: :destroy

  validates :username, presence: true

  private

  def generate_remember_token
    self.remember_token = SecureRandom.hex(20)
  end
end
