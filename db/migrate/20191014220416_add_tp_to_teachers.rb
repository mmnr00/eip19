class AddTpToTeachers < ActiveRecord::Migration[5.2]
  def change
    add_column :teachers, :tp, :string
  end
end
