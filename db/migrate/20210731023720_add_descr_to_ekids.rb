class AddDescrToEkids < ActiveRecord::Migration[5.2]
  def change
    add_column :ekids, :descr, :string
  end
end
