class AddStatToDdks < ActiveRecord::Migration[5.2]
  def change
    add_column :ddks, :stat, :string
  end
end
