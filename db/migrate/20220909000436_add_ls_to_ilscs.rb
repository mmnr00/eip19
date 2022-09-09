class AddLsToIlscs < ActiveRecord::Migration[5.2]
  def change
    add_column :ilscs, :crls, :text
    add_column :ilscs, :sbls, :text
  end
end
