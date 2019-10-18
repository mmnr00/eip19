class AddStsToRflts < ActiveRecord::Migration[5.2]
  def change
    add_column :rflts, :spre, :string
    add_column :rflts, :srec, :string
    add_column :rflts, :sexpr, :string
  end
end
