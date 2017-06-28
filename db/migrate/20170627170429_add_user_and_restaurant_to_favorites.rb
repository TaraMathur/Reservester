class AddUserAndRestaurantToFavorites < ActiveRecord::Migration[5.1]
  def change
  	add_reference :favorites, :restaurant
  	add_reference :favorites, :user
  end
end
