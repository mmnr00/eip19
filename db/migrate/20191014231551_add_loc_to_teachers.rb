class AddLocToTeachers < ActiveRecord::Migration[5.2]
  def change
    add_column :teachers, :loc, :string
  end
end
