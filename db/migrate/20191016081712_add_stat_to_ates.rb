class AddStatToAtes < ActiveRecord::Migration[5.2]
  def change
    add_column :ates, :stat, :boolean
  end
end
