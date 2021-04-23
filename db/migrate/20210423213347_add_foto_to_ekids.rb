class AddFotoToEkids < ActiveRecord::Migration[5.2]
  def change
    add_column :ekids, :ekid_id, :integer
  end
end
