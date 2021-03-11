class CreateDdks < ActiveRecord::Migration[5.2]
  def change
    create_table :ddks do |t|
      t.string :conum
      t.string :coname
      t.integer :perse_id

      t.timestamps
    end
  end
end
