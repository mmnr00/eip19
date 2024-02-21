class AddDunwToEkids < ActiveRecord::Migration[6.1]
  def change
    add_column :ekids, :dunw, :string
  end
end
