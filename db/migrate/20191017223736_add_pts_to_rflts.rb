class AddPtsToRflts < ActiveRecord::Migration[5.2]
  def change
    add_column :rflts, :pgmtr, :string
    add_column :rflts, :pmov, :string
    add_column :rflts, :pendr, :string
  end
end
