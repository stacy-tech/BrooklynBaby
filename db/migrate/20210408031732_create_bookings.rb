class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.string :sitter_id
      t.string :user_id
      t.datetime :datetime
      t.integer :rate
      t.integer :total_hours
      t.string :status

      t.timestamps null: false
    end
  end
end
