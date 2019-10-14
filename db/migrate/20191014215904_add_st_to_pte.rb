class AddStToPte < ActiveRecord::Migration[5.2]
  def change
    add_column :ptes, :stat, :string
  end
end
