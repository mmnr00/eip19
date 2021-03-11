class AddItemsToDdks < ActiveRecord::Migration[5.2]
  def change
    add_column :ddks, :regby, :string
    add_column :ddks, :addr, :string
    add_column :ddks, :posk, :string
    add_column :ddks, :state, :string
    add_column :ddks, :email, :string
    add_column :ddks, :ph, :string
    add_column :ddks, :mpemb, :string
    add_column :ddks, :mpeng, :string
    add_column :ddks, :mpend, :string
    add_column :ddks, :mpert, :string
    add_column :ddks, :mfiz, :string
    add_column :ddks, :mmen, :string
    add_column :ddks, :mpelb, :string
    add_column :ddks, :stafct, :integer
    add_column :ddks, :tchct, :integer
    add_column :ddks, :okuct, :integer
    add_column :ddks, :premdt, :string
    add_column :ddks, :mdl, :string
  end
end
