class AddLowerIndexesToUsers < ActiveRecord::Migration[7.2]
  def change
    remove_index :users, :email
    remove_index :users, :username

    add_index :users, "LOWER(email)", unique: true
    add_index :users, "LOWER(username)", unique: true
  end
end
