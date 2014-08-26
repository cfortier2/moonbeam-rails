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

require 'spec_helper'

describe User do
  pending "add some examples to (or delete) #{__FILE__}"
end
