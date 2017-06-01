class CreateRestaurants < ActiveRecord::Migration[5.1]
  def change
    create_table :restaurants do |t|
      t.text :name
      t.text :address
      t.bigint :phone
      t.text :food_genre

      t.timestamps
    end
  end
end
