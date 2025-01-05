class AddBtanToFotos < ActiveRecord::Migration[6.1]
  def change
    add_column :fotos, :btan_id, :integer
  end
end
