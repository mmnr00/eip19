class CreateCntps < ActiveRecord::Migration[5.2]
  def change
    create_table :cntps do |t|
      t.string :title
      t.time :start
      t.time :end
      t.string :lec
      t.string :ctn
      t.integer :proge_id

      t.timestamps
    end
  end
end
