class AddCpcuToIlscs < ActiveRecord::Migration[6.1]
  def change
    add_column :ilscs, :hosdoc, :text
    add_column :ilscs, :nmwr, :string
    add_column :ilscs, :relwr, :string
    add_column :ilscs, :telhmwr, :string
    add_column :ilscs, :phwr, :string
  end
end
