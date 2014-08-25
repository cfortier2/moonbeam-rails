class CreateBuildRequests < ActiveRecord::Migration
  def change
    create_table :build_requests do |t|
      t.integer :user_id
      t.boolean :emergency
      t.timestamp :finished_at
      t.timestamps
    end
  end
end
