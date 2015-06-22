class AddIndexToRoomDescriptionColumnToHotel < ActiveRecord::Migration
  def change
    add_index :hotels, :room_description
  end
end
