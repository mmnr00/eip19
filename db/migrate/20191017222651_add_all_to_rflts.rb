class AddAllToRflts < ActiveRecord::Migration[5.2]
  def change
    add_column :rflts, :rped, :boolean
    add_column :rflts, :rcp, :boolean
    add_column :rflts, :rntn, :boolean
    add_column :rflts, :rent, :boolean
    add_column :rflts, :roph, :boolean
    add_column :rflts, :rot, :boolean
    add_column :rflts, :rst, :boolean
    add_column :rflts, :roth, :string
  end
end
