class CreateControlSessions < ActiveRecord::Migration
  def change
    create_table :control_sessions do |t|
      t.timestamp :finished_at
      t.references :user, index: true

      t.timestamps
    end
  end
end
