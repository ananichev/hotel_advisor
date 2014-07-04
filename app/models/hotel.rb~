class Hotel < ActiveRecord::Base
	
  mount_uploader :image, ImageUploader

  belongs_to :user
  has_many   :comments
  
  validates :title, :room_description, :price_for_room, :state, :city, :street, :hotels_country, :user_id, presence: true
  validates :room_description, length: { minimum: 50 }  
  
end

