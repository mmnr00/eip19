class AddNwsToDdks < ActiveRecord::Migration[6.1]
  def change
    add_column :ddks, :amtpmt, :float
    add_column :ddks, :dtpmt, :date
    add_column :ddks, :admhist, :text
  end
end
