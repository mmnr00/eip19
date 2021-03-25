class AddAnisToProges < ActiveRecord::Migration[5.2]
  def change
    add_column :proges, :acv, :boolean
    add_column :proges, :tp, :string
  end
end
