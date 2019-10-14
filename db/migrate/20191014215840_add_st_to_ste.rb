class AddStToSte < ActiveRecord::Migration[5.2]
  def change
    add_column :stes, :stat, :string
  end
end
