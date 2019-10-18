class AddOtsToRflts < ActiveRecord::Migration[5.2]
  def change
    add_column :rflts, :osens, :string
    add_column :rflts, :obeob, :string
    add_column :rflts, :ocog, :string
    add_column :rflts, :ogmtr, :string
    add_column :rflts, :ofmtr, :string
  end
end
