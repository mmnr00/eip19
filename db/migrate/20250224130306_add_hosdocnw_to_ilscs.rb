class AddHosdocnwToIlscs < ActiveRecord::Migration[6.1]
  def change
    add_column :ilscs, :hosdocnw, :text
  end
end
