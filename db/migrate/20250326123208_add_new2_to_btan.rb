class AddNew2ToBtan < ActiveRecord::Migration[7.2]
  def change
    add_column :btans, :perse_id, :integer
    add_column :btans, :del, :boolean
  end
end
