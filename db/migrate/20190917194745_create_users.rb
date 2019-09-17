class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :hisName
      t.string :herName
      t.text :pubKey
      t.text :privKey
      t.date :anniversary
      t.string :email
      t.string :username

      t.timestamps
    end
  end
end
