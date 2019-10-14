class AddEkToAte < ActiveRecord::Migration[5.2]
  def change
    add_column :ates, :ekid_id, :integer
  end
end
