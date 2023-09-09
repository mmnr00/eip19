class AddPerseToKdans < ActiveRecord::Migration[6.1]
  def change
    add_column :kdans, :perse_id, :integer
  end
end
