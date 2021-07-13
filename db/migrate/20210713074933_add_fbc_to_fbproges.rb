class AddFbcToFbproges < ActiveRecord::Migration[5.2]
  def change
    add_column :fbproges, :fbc, :boolean
  end
end
