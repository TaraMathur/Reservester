class CreateReservations < ActiveRecord::Migration[5.1]
  def change
    create_table :reservations do |t|
      t.string :user
      t.references :restaurant, foreign_key: true
      t.string :time

      t.timestamps
    end
  end
end
