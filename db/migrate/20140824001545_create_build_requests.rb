class CreateBuildRequests < ActiveRecord::Migration
  def change
    create_table :build_requests do |t|
      t.references :user, index: true
      t.boolean :emergency

      t.timestamps
    end
  end
end
