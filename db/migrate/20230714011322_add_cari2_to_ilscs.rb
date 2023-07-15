class AddCari2ToIlscs < ActiveRecord::Migration[6.1]
  def change
    add_column :ilscs, :selspr, :string
  end
end
