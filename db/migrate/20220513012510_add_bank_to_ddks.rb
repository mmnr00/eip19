class AddBankToDdks < ActiveRecord::Migration[5.2]
  def change
    add_column :ddks, :accno, :string
    add_column :ddks, :accname, :string
    add_column :ddks, :accbank, :string
  end
end
