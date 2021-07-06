class AddStdokuToPerses < ActiveRecord::Migration[5.2]
  def change
    add_column :perses, :stdoku, :text
  end
end
