class AddBankToBtnpnls < ActiveRecord::Migration[7.2]
  def change
    add_column :btnpnls, :banknm, :string
  end
end
