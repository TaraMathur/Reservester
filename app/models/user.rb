class User < ApplicationRecord
	  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

   has_many :restaurants
   has_many :favorites
   has_many :favorite_restaurants, source: :restaurant, through: :favorites

def is_owner?
	role == "owner"
end

end