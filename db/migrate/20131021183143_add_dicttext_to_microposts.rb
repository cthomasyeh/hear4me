class AddDicttextToMicroposts < ActiveRecord::Migration
  def change
    add_column :microposts, :dict_text, :string
  end
end
