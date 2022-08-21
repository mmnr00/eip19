class AddTpToIlscs < ActiveRecord::Migration[5.2]
  def change
    add_column :ilscs, :tp, :string
  end
end
