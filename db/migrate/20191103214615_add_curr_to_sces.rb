class AddCurrToSces < ActiveRecord::Migration[5.2]
  def change
    add_column :sces, :curr, :boolean
  end
end
