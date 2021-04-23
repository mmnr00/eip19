class AddTpToEkids < ActiveRecord::Migration[5.2]
  def change
    add_column :ekids, :tp, :string
  end
end
