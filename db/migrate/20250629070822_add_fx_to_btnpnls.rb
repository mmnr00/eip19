class AddFxToBtnpnls < ActiveRecord::Migration[7.2]
  def change
    add_column :btnpnls, :fax, :string
  end
end
