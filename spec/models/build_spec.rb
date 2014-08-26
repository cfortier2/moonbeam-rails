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

require 'spec_helper'

describe Build do
  pending "add some examples to (or delete) #{__FILE__}"
end
