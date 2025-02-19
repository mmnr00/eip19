class AddCatgcpToIlscs < ActiveRecord::Migration[6.1]
  def change
    add_column :ilscs, :catgcp, :string
  end
end
