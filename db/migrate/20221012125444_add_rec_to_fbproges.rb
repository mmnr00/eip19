class AddRecToFbproges < ActiveRecord::Migration[5.2]
  def change
    add_column :fbproges, :recm, :string
  end
end
