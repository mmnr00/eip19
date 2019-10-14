class AddEkToPte < ActiveRecord::Migration[5.2]
  def change
    add_column :ptes, :ekid_id, :integer
  end
end
