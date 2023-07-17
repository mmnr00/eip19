class AddOth3ToIlscs < ActiveRecord::Migration[6.1]
  def change
    add_column :ilscs, :okufm, :string
    add_column :ilscs, :rdoku, :string
    add_column :ilscs, :othcrs, :string
  end
end
