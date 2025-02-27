class AddToolcpToIlscs < ActiveRecord::Migration[6.1]
  def change
    add_column :ilscs, :toolcp, :string
  end
end
