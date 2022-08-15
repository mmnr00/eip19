class AddIlscToFotos < ActiveRecord::Migration[5.2]
  def change
    add_column :fotos, :ilsc_id, :integer
  end
end
