class AddDesrToBtan < ActiveRecord::Migration[6.1]
  def change
    add_column :btans, :descr, :string
    add_column :btans, :descrls, :text
  end
end
