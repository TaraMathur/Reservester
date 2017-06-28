class RestaurantsController < ApplicationController
	before_action :set_restaurant, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, except: [:index, :show]
#	before_action :check_user

	def new #restaurants/index.html
		@restaurant = Restaurant.new
	end

	def create
		@restaurant = current_user.restaurants.new(params.require(:restaurant).permit(:name, :phone, :address, :genre, :photo, :favorite))

		@restaurant.user = current_user
		if @restaurant.save
			redirect_to @restaurant #restaurants/id (shows)
		else
			render 'new'
		end
	end

	def edit
		@restaurant = Restaurant.find(params[:id])
	end

	def destroy
		Restaurant.find(params[:id]).delete
		redirect_to restaurants_path
     end

	def update
		@restaurant = Restaurant.find(params[:id])
		if @restaurant.update(params.require(:restaurant).permit(:name,:phone,:address,:genre, :photo, :favorite))
			redirect_to @restaurant
		else
			render 'edit'
		end
	end

	def show
		@restaurant = Restaurant.find(params[:id])
	end

	def index
		@current_user = current_user

		if current_user && current_user.is_owner?
			@restaurants = current_user.restaurants
		else
			@restaurants = Restaurant.all
		end
	end

def dashboard
	@restaurants = current_user.restaurants
	render 'index'
end

def favorite
	byebug

  @restaurant = Restaurant.find(params[:id])
  if params[:type] == "favorite"
      Favorite.create(restaurant: @restaurant, user: current_user)
      redirect_to @restaurant, notice: "Restaurant Favorited!"
    else
      @restaurant.favoritors.delete(current_user)
      redirect_to @restaurant, notice: "Restaurant Unfavorited :c"
    end
end

private
def set_restaurant
	@restaurant = Restaurant.find(params[:id])
end

def check_user
	if @restaurant
		redirect_to :restaurants, notice: 'This is not your restaurant.' if(@restaurant.user!=current_user) end
	end
end
