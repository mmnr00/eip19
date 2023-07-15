class AddCariToIlscs < ActiveRecord::Migration[6.1]
  def change
    add_column :ilscs, :marstat, :string
    add_column :ilscs, :dun, :string
    add_column :ilscs, :parl, :string
    add_column :ilscs, :prevmaj, :text
  end
end
