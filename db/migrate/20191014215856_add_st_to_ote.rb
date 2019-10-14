class AddStToOte < ActiveRecord::Migration[5.2]
  def change
    add_column :otes, :stat, :string
  end
end
