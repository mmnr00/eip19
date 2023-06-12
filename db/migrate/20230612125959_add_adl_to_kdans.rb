class AddAdlToKdans < ActiveRecord::Migration[6.1]
  def change
    add_column :kdans, :notel, :string
    add_column :kdans, :email, :string
  end
end
