class CreateSitters < ActiveRecord::Migration[5.2]
  def change
    create_table :sitters do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :telephone_number
      t.string :gender
      t.text :bio
      t.integer :rate
      t.integer :age 

      t.timestamps null: false
    end
  end
end
