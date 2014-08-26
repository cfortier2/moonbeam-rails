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

require 'spec_helper'

describe ControlSession do
  pending "add some examples to (or delete) #{__FILE__}"
end
