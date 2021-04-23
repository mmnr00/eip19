class AddEkidToFotos < ActiveRecord::Migration[5.2]
  def change
    add_column :fotos, :ekid_id, :integer
  end
end
