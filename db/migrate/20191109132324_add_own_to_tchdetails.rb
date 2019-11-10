class AddOwnToTchdetails < ActiveRecord::Migration[5.2]
  def change
    add_column :tchdetails, :owner_id, :integer
  end
end
