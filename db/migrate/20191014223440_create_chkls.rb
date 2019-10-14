class CreateChkls < ActiveRecord::Migration[5.2]
  def change
    create_table :chkls do |t|
      t.text :gmtr
      t.text :fmtr
      t.text :adbh
      t.text :splg
      t.text :cogn
      t.text :audl
      t.text :prvb
      t.text :rcel
      t.string :rslc

      t.timestamps
    end
  end
end
