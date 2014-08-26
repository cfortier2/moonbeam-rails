class AddGivenControlAtToBuildRequest < ActiveRecord::Migration
  def change
    add_column :build_requests, :given_control_at, :timestamp
  end
end
