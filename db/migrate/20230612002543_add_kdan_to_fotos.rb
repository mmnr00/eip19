class AddKdanToFotos < ActiveRecord::Migration[6.1]
  def change
    add_column :fotos, :kdan_id, :integer
  end
end
