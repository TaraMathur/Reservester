class Restaurant < ApplicationRecord
	belongs_to :user
	has_attached_file :photo

	validates_attachment_content_type :photo, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

	has_many :reservations
#	validates :user, presence: true
end

