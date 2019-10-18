class RemoveHsFromRflts < ActiveRecord::Migration[5.2]
  def change
    remove_column :rflts, :ota, :text
    remove_column :rflts, :sta, :text
    remove_column :rflts, :ata, :text
    remove_column :rflts, :pta, :text
  end
end
