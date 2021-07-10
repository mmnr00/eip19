class AddDateToCntps < ActiveRecord::Migration[5.2]
  def change
    add_column :cntps, :dt, :date
  end
end
