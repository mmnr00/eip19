class AddOld1ToDdks < ActiveRecord::Migration[5.2]
  def change
    add_column :ddks, :old1, :bool
  end
end
