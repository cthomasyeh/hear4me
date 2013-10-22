class CreateReminders < ActiveRecord::Migration
  def change
    create_table :reminders do |t|
      t.integer :user_id
      t.string :photo_link
      t.string :audio_link
      t.string :text
      t.time :first
      t.time :second
      t.time :third
      t.time :fourth
      t.time :fifth
      t.time :sixth
      t.integer :frequency

      t.timestamps
    end
  end
end
