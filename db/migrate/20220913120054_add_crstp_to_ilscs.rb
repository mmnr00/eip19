class AddCrstpToIlscs < ActiveRecord::Migration[5.2]
  def change
    add_column :ilscs, :crstp, :text
  end
end
