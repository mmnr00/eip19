class AddOkuToDdks < ActiveRecord::Migration[5.2]
  def change
    add_column :ddks, :okucnt, :integer
  end
end
