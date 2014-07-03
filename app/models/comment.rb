class Comment < ActiveRecord::Base

  belongs_to :user
  belongs_to :hotel

  validates :body,   presence: true, length: { maximum: 500 }
  validates :rating, :user_id, :hotel_id, presence: true
end
