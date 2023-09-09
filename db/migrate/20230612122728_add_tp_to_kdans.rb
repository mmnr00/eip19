class AddTpToKdans < ActiveRecord::Migration[6.1]
  def change
    add_column :kdans, :tp, :string
  end
end
