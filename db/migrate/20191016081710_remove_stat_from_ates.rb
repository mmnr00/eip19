class RemoveStatFromAtes < ActiveRecord::Migration[5.2]
  def change
    remove_column :ates, :stat, :string
  end
end
