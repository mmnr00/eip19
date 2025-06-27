class CreateBtnpnls < ActiveRecord::Migration[7.2]
  def change
    create_table :btnpnls do |t|
      t.string :name
      t.string :acctnm
      t.string :acctno
      t.string :ph
      t.string :email
      t.string :stat
      t.string :addr
      t.string :tp

      t.timestamps
    end
  end
end
