class AddTchToStes < ActiveRecord::Migration[5.2]
  def change
    add_column :stes, :teacher_id, :integer
  end
end
