class CreateFbproges < ActiveRecord::Migration[5.2]
  def change
    create_table :fbproges do |t|
      t.integer :rate
      t.integer :perse_id
      t.integer :proge_id
      t.text :ctnr
      t.string :cmt

      t.timestamps
    end
  end
end
