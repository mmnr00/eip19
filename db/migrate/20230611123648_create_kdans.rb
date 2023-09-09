class CreateKdans < ActiveRecord::Migration[6.1]
  def change
    create_table :kdans do |t|
      t.string :name
      t.string :ic
      t.string :okukd
      t.string :gender
      t.string :race
      t.date :dob
      t.string :brtplc
      t.string :addr
      t.string :job
      t.string :payr
      t.string :prtname
      t.string :prtrel
      t.string :prtic
      t.string :prtgender
      t.string :prtrace
      t.string :prtaddr
      t.string :prtfon
      t.string :prtemail
      t.string :prtjob
      t.string :prtpay

      t.timestamps
    end
  end
end
