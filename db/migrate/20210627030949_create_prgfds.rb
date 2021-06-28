class CreatePrgfds < ActiveRecord::Migration[5.2]
  def change
    create_table :prgfds do |t|
      t.integer :rate
      t.string :good
      t.string :bad
      t.integer :perse_id
      t.integer :proge_id

      t.timestamps
    end
  end
end
