class AddEipToOwners < ActiveRecord::Migration[5.2]
  def change
    add_column :owners, :tp, :string
    add_column :owners, :loc, :string
  end
end
