class AddEkToChkls < ActiveRecord::Migration[5.2]
  def change
    add_column :chkls, :ekid_id, :integer
  end
end
