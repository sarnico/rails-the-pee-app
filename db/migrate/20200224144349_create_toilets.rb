class CreateToilets < ActiveRecord::Migration[5.2]
  def change
    create_table :toilets do |t|
      t.string :name
      t.text :address
      t.references :user, foreign_key: true
      t.datetime :min_booking_time
      t.datetime :max_booking_time

      t.timestamps
    end
  end
end
