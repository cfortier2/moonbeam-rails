# == Schema Information
#
# Table name: users
#
#  id             :integer          not null, primary key
#  username       :string(255)
#  email          :string(255)
#  name           :string(255)
#  avatar         :string(255)
#  remember_token :string(255)
#  admin          :boolean
#  created_at     :datetime
#  updated_at     :datetime
#
# Indexes
#
#  index_users_on_remember_token  (remember_token)
#  index_users_on_username        (username)
#

class User < ActiveRecord::Base
  before_create :generate_remember_token

  has_many :build_requests, dependent: :destroy
  has_many :control_sessions, dependent: :destroy
  has_many :builds, dependent: :destroy

  validates :username, presence: true

  private

  def generate_remember_token
    self.remember_token = SecureRandom.hex(20)
  end
end
