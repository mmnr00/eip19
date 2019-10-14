class AddEkToSte < ActiveRecord::Migration[5.2]
  def change
    add_column :stes, :ekid_id, :integer
  end
end
