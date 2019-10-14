class AddSrToSkids < ActiveRecord::Migration[5.2]
  def change
    add_column :skids, :diag, :string
    add_column :skids, :summ, :string
    add_column :skids, :assr, :string
    add_column :skids, :obs, :string
    add_column :skids, :refc, :string
    add_column :skids, :frmo, :string
    add_column :skids, :scp, :string
    add_column :skids, :cmt, :string
    add_column :skids, :ovc, :string
  end
end
