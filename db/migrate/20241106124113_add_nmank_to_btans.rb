class AddNmankToBtans < ActiveRecord::Migration[6.1]
  def change
    add_column :btans, :nmkd, :string
  end
end
