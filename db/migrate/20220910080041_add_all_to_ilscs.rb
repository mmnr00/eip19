class AddAllToIlscs < ActiveRecord::Migration[5.2]
  def change
    add_column :ilscs, :birthplc, :string
    add_column :ilscs, :phtr, :string
    add_column :ilscs, :sport, :string
    add_column :ilscs, :hobby, :string
    add_column :ilscs, :jobint, :string
    add_column :ilscs, :occdiag, :string
    add_column :ilscs, :medc, :string
    add_column :ilscs, :occmedc, :string
    add_column :ilscs, :amtmedc, :string
    add_column :ilscs, :docnm, :string
    add_column :ilscs, :docph, :string
  end
end
