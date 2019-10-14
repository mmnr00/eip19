class CreateAtes < ActiveRecord::Migration[5.2]
  def change
    create_table :ates do |t|
      t.string :hr
      t.string :tin
      t.string :ear
      t.string :resp
      t.string :ovc

      t.timestamps
    end
  end
end
