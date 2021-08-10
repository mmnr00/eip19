class AddExmToEkrps < ActiveRecord::Migration[5.2]
  def change
    add_column :ekrps, :exmls, :text
  end
end
