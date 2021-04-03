class AddPicToArtks < ActiveRecord::Migration[5.2]
  def change
    add_column :artks, :pic, :string
  end
end
