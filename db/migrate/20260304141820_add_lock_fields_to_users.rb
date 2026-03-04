class AddLockFieldsToUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :failed_logins_count, :integer, default: 0, null: false
    add_column :users, :lock_expires_at, :datetime
  end
end
