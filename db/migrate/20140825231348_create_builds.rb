class CreateBuilds < ActiveRecord::Migration
  def change
    create_table :builds do |t|
      t.timestamp :finished_at
      t.references :user, index: true
      t.references :environment, index: true
      t.string :sha
      t.boolean :successful

      t.timestamps
    end
  end
end
