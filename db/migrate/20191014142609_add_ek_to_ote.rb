class AddEkToOte < ActiveRecord::Migration[5.2]
  def change
    add_column :otes, :ekid_id, :integer
  end
end
