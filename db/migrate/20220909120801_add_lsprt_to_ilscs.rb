class AddLsprtToIlscs < ActiveRecord::Migration[5.2]
  def change
    add_column :ilscs, :prtls, :text
    add_column :ilscs, :warls, :text
  end
end
