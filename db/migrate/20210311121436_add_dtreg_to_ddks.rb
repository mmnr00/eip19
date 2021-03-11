class AddDtregToDdks < ActiveRecord::Migration[5.2]
  def change
    add_column :ddks, :dtreg, :date
  end
end
