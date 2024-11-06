class CreateBtans < ActiveRecord::Migration[6.1]
  def change
    create_table :btans do |t|
      t.string :name
      t.string :ic
      t.string :dun

      t.timestamps
    end
  end
end
