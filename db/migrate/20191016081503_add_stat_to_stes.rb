class AddStatToStes < ActiveRecord::Migration[5.2]
  def change
    add_column :stes, :stat, :boolean
  end
end
