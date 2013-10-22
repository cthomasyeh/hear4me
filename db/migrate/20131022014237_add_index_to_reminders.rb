class AddIndexToReminders < ActiveRecord::Migration
  def change
    add_index :reminders, [:user_id, :created_at]
  end
end
