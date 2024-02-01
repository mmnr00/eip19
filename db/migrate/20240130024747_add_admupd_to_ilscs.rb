class AddAdmupdToIlscs < ActiveRecord::Migration[6.1]
  def change
    add_column :ilscs, :admupd, :text
  end
end
