class AddPrsToIlscs < ActiveRecord::Migration[5.2]
  def change
    add_column :ilscs, :perse_id, :integer
  end
end
