class Users < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :fullname
      t.string :email
      t.string :phonenumber
      t.string :languages
      t.string :role  
      t.timestamps
    end 
  end
end
