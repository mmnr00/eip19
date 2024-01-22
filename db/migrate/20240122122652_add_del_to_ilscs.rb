class AddDelToIlscs < ActiveRecord::Migration[6.1]
  def change
    add_column :ilscs, :del, :boolean
  end
end
