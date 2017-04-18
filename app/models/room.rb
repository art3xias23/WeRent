class Room < ApplicationRecord
    

  belongs_to :user
  has_many :pictures
  has_many :reservations
  has_many :reviews

  geocoded_by :address
  after_validation :geocode, :if => :address_changed?
  

  validates :home_type, presence: true
  validates :room_type, presence: true
  validates :accommodate, presence: true
  validates :bed_room, presence: true
  validates :bath_room, presence: true
  validates :listing_name, presence: true, length: {maximum: 50}
  validates :summary, presence: true, length: {maximum: 5}
  validates :address, presence: true
  validates :price, presence: true
  #checks if there any reviewsand it gives the avarage of the review
  def average_rating
    reviews.count == 0 ? 0 : reviews.average(:star).round(2)
  end

end
