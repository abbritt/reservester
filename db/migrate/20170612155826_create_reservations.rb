class CreateReservations < ActiveRecord::Migration[5.1]
  def change
    create_table :reservations do |t|
      t.string :reserver
      t.date :time
      t.text :special_requests
      t.references :restaurants, foreign_key: true

      t.timestamps
    end
  end
end
