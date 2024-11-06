class AddAnakToBtans < ActiveRecord::Migration[6.1]
  def change
    add_column :btans, :namakd, :string
    add_column :btans, :ickd, :string
    add_column :btans, :gdrkd, :string
    add_column :btans, :racekd, :string
    add_column :btans, :relkd, :string
    add_column :btans, :addrkd, :string
    add_column :btans, :okuno, :string
    add_column :btans, :okutp, :string
    add_column :btans, :statekd, :string
    add_column :btans, :perdkd, :string
    add_column :btans, :sekkd, :string
  end
end
