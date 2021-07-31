class AddCatgToQsas < ActiveRecord::Migration[5.2]
  def change
    add_column :qsas, :catg, :string
  end
end
