class Restaurant < ApplicationRecord
	validates :name, presence: true, length: {minimum: 2}
  	validates :address, presence: true, length: {minimum: 10}
  	validates :phone, presence: true, length: {minimum: 10}
  	validates :genre, presence: true, length: {minimum: 2}
	
	geocoded_by :address
  	after_validation :geocode

	has_attached_file :photo
	validates_attachment_content_type :photo, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

	belongs_to :user
	has_many :reservations
	has_many :favorites
	has_many :favoritors, source: :user, through: :favorites
#	validates :user, presence: true

	def google_map(center)
    "https://maps.googleapis.com/maps/api/staticmap?center=#{center}&size=300x300&zoom=17"
  	end
end

