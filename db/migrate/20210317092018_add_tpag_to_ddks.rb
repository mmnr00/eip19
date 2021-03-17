class AddTpagToDdks < ActiveRecord::Migration[5.2]
  def change
    add_column :ddks, :agtp, :string
  end
end
