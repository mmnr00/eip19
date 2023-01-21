class AddStToEkids < ActiveRecord::Migration[6.1]
  def change
    add_column :ekids, :phs, :string
    add_column :ekids, :dtp, :date
    add_column :ekids, :dts, :date
    add_column :ekids, :dte, :date
    add_column :ekids, :admupd, :text
  end
end
