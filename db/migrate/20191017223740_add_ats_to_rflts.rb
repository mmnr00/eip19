class AddAtsToRflts < ActiveRecord::Migration[5.2]
  def change
    add_column :rflts, :ahr, :string
    add_column :rflts, :atin, :string
    add_column :rflts, :aear, :string
    add_column :rflts, :aresp, :string
  end
end
