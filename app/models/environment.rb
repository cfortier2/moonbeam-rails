# == Schema Information
#
# Table name: environments
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Environment < ActiveRecord::Base
end
