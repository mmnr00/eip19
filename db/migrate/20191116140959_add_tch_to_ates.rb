class AddTchToAtes < ActiveRecord::Migration[5.2]
  def change
    add_column :ates, :teacher_id, :integer
  end
end
