class CreateEkrps < ActiveRecord::Migration[5.2]
  def change
    create_table :ekrps do |t|
      t.datetime :dt
      t.integer :ekid_id

      t.timestamps
    end
  end
end
