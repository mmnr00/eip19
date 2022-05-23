class AddPraToEkids < ActiveRecord::Migration[5.2]
  def change
    add_column :ekids, :curreip, :string
    add_column :ekids, :nmeip, :string
    add_column :ekids, :tmeip, :string
  end
end
