class CreateIlscs < ActiveRecord::Migration[5.2]
  def change
    create_table :ilscs do |t|
      t.string :name
      t.string :ic
      t.string :applnm
      t.string :applic
      t.string :addr
      t.string :ph
      t.string :vote
      t.string :email
      t.string :race
      t.string :relg
      t.string :oku
      t.string :dob
      t.string :gender
      t.string :diag
      t.string :lastsch
      t.string :allerg

      t.timestamps
    end
  end
end
