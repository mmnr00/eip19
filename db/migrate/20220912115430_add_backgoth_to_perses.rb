class AddBackgothToPerses < ActiveRecord::Migration[5.2]
  def change
    add_column :perses, :backgoth, :string
  end
end
