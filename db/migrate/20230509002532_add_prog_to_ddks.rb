class AddProgToDdks < ActiveRecord::Migration[6.1]
  def change
    add_column :ddks, :progt, :string
  end
end
