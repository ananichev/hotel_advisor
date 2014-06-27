class CreateHotels < ActiveRecord::Migration
  def change
    create_table :hotels do |t|
      t.string  :title
      t.integer :star_rating
      t.boolean :breakfast_included
      t.string  :room_description
      t.integer :price_for_room
      t.string  :state
      t.string  :city
      t.string  :street
      t.string  :hotels_country
      t.timestamps
    end
  end
end
