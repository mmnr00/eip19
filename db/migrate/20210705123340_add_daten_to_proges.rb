class AddDatenToProges < ActiveRecord::Migration[5.2]
  def change
    add_column :proges, :daten, :date
  end
end
