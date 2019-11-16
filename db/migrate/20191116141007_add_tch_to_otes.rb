class AddTchToOtes < ActiveRecord::Migration[5.2]
  def change
    add_column :otes, :teacher_id, :integer
  end
end
