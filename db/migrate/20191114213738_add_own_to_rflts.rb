class AddOwnToRflts < ActiveRecord::Migration[5.2]
  def change
    add_column :rflts, :owner_id, :integer
  end
end
