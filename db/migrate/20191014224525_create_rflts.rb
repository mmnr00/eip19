class CreateRflts < ActiveRecord::Migration[5.2]
  def change
    create_table :rflts do |t|
      t.text :rfpl
      t.text :ota
      t.text :sta
      t.text :ata
      t.text :pta
      t.string :ovc
      t.integer :ekid_id

      t.timestamps
    end
  end
end
