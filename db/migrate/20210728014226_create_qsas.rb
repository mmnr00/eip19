class CreateQsas < ActiveRecord::Migration[5.2]
  def change
    create_table :qsas do |t|
      t.string :ques
      t.string :ans
      t.string :stat
      t.string :email
      t.string :name
      t.string :ph

      t.timestamps
    end
  end
end
