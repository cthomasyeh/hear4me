class AddPhotolinkToMicroposts < ActiveRecord::Migration
  def change
    add_column :microposts, :photo_link, :string
  end
end
