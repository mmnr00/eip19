class RemoveStatFromStes < ActiveRecord::Migration[5.2]
  def change
    remove_column :stes, :stat, :string
  end
end
