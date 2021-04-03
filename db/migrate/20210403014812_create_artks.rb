class CreateArtks < ActiveRecord::Migration[5.2]
  def change
    create_table :artks do |t|
      t.string :title
      t.string :author
      t.string :headl
      t.string :bodl

      t.timestamps
    end
  end
end
