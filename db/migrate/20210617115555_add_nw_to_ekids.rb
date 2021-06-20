class AddNwToEkids < ActiveRecord::Migration[5.2]
  def change
    add_column :ekids, :okunum, :string
    add_column :ekids, :birthplc, :string
    add_column :ekids, :relign, :string
    add_column :ekids, :race, :string
    add_column :ekids, :reltn, :string
    add_column :ekids, :allg, :string
    add_column :ekids, :diet, :string
    add_column :ekids, :fic, :string
    add_column :ekids, :mic, :string
    add_column :ekids, :frace, :string
    add_column :ekids, :mrace, :string
    add_column :ekids, :frelign, :string
    add_column :ekids, :mrelign, :string
  end
end
