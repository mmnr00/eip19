class AddPrtToEkids < ActiveRecord::Migration[5.2]
  def change
    add_column :ekids, :parent_id, :integer
  end
end
