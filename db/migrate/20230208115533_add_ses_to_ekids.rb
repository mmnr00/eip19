class AddSesToEkids < ActiveRecord::Migration[6.1]
  def change
    add_column :ekids, :sesd, :string
    add_column :ekids, :sest, :string
  end
end
