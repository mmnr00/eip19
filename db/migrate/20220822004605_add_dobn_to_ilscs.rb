class AddDobnToIlscs < ActiveRecord::Migration[5.2]
  def change
    add_column :ilscs, :dobn, :date
  end
end
