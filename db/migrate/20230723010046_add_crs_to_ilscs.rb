class AddCrsToIlscs < ActiveRecord::Migration[6.1]
  def change
    add_column :ilscs, :plcadm, :string
    add_column :ilscs, :crsadm, :string
  end
end
