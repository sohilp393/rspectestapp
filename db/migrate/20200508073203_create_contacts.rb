class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :username
      t.string :firstname
      t.string :lastname
      t.string :email
      t.string :password


      t.timestamps null: false
    end
  end
end
