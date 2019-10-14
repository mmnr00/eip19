class CreatePtes < ActiveRecord::Migration[5.2]
  def change
    create_table :ptes do |t|
      t.string :gmtr
      t.string :mov
      t.string :endr
      t.string :ovc

      t.timestamps
    end
  end
end
