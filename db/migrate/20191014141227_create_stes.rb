class CreateStes < ActiveRecord::Migration[5.2]
  def change
    create_table :stes do |t|
      t.string :pre
      t.string :rec
      t.string :expr
      t.string :ovc

      t.timestamps
    end
  end
end
