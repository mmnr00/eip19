class AddCpculsToIlscs < ActiveRecord::Migration[6.1]
  def change
    add_column :ilscs, :cpculs, :string
  end
end
