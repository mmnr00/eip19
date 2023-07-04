class AddDtpToIlscs < ActiveRecord::Migration[6.1]
  def change
    add_column :ilscs, :dtp, :date
    add_column :ilscs, :dts, :date
    add_column :ilscs, :dte, :date
  end
end
