class AddPerseToEkids < ActiveRecord::Migration[5.2]
  def change
    add_column :ekids, :perse_id, :integer
  end
end
