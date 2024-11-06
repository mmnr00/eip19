class AddMoreToBtans < ActiveRecord::Migration[6.1]
  def change
    add_column :btans, :purp, :string
    add_column :btans, :amnt, :integer
    add_column :btans, :marr, :string
    add_column :btans, :addr, :string
    add_column :btans, :perd, :string
    add_column :btans, :undi, :string
    add_column :btans, :race, :string
    add_column :btans, :relg, :string
    add_column :btans, :phhm, :string
    add_column :btans, :phmb, :string
    add_column :btans, :empl, :string
    add_column :btans, :phemp, :string
    add_column :btans, :sect, :string
    add_column :btans, :gaji, :integer
    add_column :btans, :rel, :string
    add_column :btans, :namesp, :string
    add_column :btans, :icsp, :string
    add_column :btans, :addrsp, :string
    add_column :btans, :perdsp, :string
    add_column :btans, :undisp, :string
    add_column :btans, :phhmsp, :string
    add_column :btans, :phmbsp, :string
    add_column :btans, :emplsp, :string
    add_column :btans, :phempsp, :string
    add_column :btans, :sectsp, :string
    add_column :btans, :gajisp, :integer
    add_column :btans, :relsp, :string
    add_column :btans, :household, :text
    add_column :btans, :histbtn, :text
  end
end
