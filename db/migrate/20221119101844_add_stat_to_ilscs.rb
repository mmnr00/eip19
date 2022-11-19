class AddStatToIlscs < ActiveRecord::Migration[5.2]
  def change
    add_column :ilscs, :stat, :string
    add_column :ilscs, :descr, :string
  end
end
