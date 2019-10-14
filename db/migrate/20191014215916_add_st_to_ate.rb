class AddStToAte < ActiveRecord::Migration[5.2]
  def change
    add_column :ates, :stat, :string
  end
end
