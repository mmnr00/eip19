class AddBookToArtks < ActiveRecord::Migration[5.2]
  def change
    add_column :artks, :book, :text
  end
end
