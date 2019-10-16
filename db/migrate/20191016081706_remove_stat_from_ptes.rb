class RemoveStatFromPtes < ActiveRecord::Migration[5.2]
  def change
    remove_column :ptes, :stat, :string
  end
end
