class AddJbnToPerses < ActiveRecord::Migration[5.2]
  def change
    add_column :perses, :add, :string
    add_column :perses, :race, :string
    add_column :perses, :backg, :string
    add_column :perses, :backgo, :string
    add_column :perses, :kdoku, :string
    add_column :perses, :kdiag, :string
    add_column :perses, :email, :string
  end
end
