class AddAttToPerproges < ActiveRecord::Migration[5.2]
  def change
    add_column :perproges, :att, :text
  end
end
