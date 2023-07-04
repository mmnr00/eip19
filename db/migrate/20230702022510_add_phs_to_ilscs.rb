class AddPhsToIlscs < ActiveRecord::Migration[6.1]
  def change
    add_column :ilscs, :phs, :string
  end
end
