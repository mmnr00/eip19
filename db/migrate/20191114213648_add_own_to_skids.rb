class AddOwnToSkids < ActiveRecord::Migration[5.2]
  def change
    add_column :skids, :owner_id, :integer
  end
end
