class AddYrToDdks < ActiveRecord::Migration[5.2]
  def change
    add_column :ddks, :regyr, :string
  end
end
