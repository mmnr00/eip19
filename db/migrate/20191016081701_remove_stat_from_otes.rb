class RemoveStatFromOtes < ActiveRecord::Migration[5.2]
  def change
    remove_column :otes, :stat, :string
  end
end
