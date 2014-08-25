class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :name
      t.string :avatar
      t.string :remember_token
      t.boolean :admin

      t.timestamps
    end

    add_index :users, :username
    add_index :users, :remember_token
  end
end
