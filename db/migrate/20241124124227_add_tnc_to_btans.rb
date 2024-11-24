class AddTncToBtans < ActiveRecord::Migration[6.1]
  def change
    add_column :btans, :tnc, :boolean
  end
end
