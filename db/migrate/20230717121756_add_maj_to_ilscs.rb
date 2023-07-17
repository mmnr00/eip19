class AddMajToIlscs < ActiveRecord::Migration[6.1]
  def change
    add_column :ilscs, :majnm, :string
    add_column :ilscs, :majjw, :string
    add_column :ilscs, :majjbt, :string
    add_column :ilscs, :majtmp, :string
    add_column :ilscs, :majadd, :string
    add_column :ilscs, :majtel, :string
    add_column :ilscs, :majfaks, :string
    add_column :ilscs, :majeml, :string
  end
end
