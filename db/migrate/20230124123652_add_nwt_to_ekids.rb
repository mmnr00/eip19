class AddNwtToEkids < ActiveRecord::Migration[6.1]
  def change
    add_column :ekids, :dtwlk, :string
    add_column :ekids, :kdhealth, :string
  end
end
