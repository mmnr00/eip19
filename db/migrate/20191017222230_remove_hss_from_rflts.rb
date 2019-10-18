class RemoveHssFromRflts < ActiveRecord::Migration[5.2]
  def change
    remove_column :rflts, :rfpl, :text
  end
end
