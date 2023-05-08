class AddDdkToFotos < ActiveRecord::Migration[6.1]
  def change
    add_column :fotos, :ddk_id, :integer
  end
end
