class AddTchToPtes < ActiveRecord::Migration[5.2]
  def change
    add_column :ptes, :teacher_id, :integer
  end
end
