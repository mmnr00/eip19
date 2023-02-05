class AddDelToEkids < ActiveRecord::Migration[6.1]
  def change
    add_column :ekids, :del, :boolean
  end
end
