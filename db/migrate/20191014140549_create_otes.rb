class CreateOtes < ActiveRecord::Migration[5.2]
  def change
    create_table :otes do |t|
      t.string :sens
      t.string :beob
      t.string :cog
      t.string :gmtr
      t.string :fmtr
      t.string :ovc

      t.timestamps
    end
  end
end
