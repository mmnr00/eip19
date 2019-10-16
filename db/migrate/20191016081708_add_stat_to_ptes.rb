class AddStatToPtes < ActiveRecord::Migration[5.2]
  def change
    add_column :ptes, :stat, :boolean
  end
end
