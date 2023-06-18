class AddStatToKdans < ActiveRecord::Migration[6.1]
  def change
    add_column :kdans, :stat, :string
  end
end
