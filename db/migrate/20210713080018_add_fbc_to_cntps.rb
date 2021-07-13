class AddFbcToCntps < ActiveRecord::Migration[5.2]
  def change
    add_column :cntps, :fbc, :boolean
  end
end
