class AddRtToFbproges < ActiveRecord::Migration[5.2]
  def change
    add_column :fbproges, :rate2, :integer
    add_column :fbproges, :rate3, :integer
    add_column :fbproges, :rate4, :integer
    add_column :fbproges, :rate5, :integer
  end
end
