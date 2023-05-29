class AddN23ToDdks < ActiveRecord::Migration[6.1]
  def change
    add_column :ddks, :jawatanwakil, :string
    add_column :ddks, :bilterapi, :string
  end
end
