class AddStatToOtes < ActiveRecord::Migration[5.2]
  def change
    add_column :otes, :stat, :boolean
  end
end
