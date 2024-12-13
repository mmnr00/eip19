class AddStatToBtans < ActiveRecord::Migration[6.1]
  def change
    add_column :btans, :stat, :string
  end
end
