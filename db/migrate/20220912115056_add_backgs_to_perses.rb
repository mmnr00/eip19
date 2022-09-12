class AddBackgsToPerses < ActiveRecord::Migration[5.2]
  def change
    add_column :perses, :backgs, :string
  end
end
