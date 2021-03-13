class AddStatrsToDdks < ActiveRecord::Migration[5.2]
  def change
    add_column :ddks, :statrs, :string
  end
end
