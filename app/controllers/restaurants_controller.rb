class RestaurantsController < ApplicationController
	before_action :set_restaurant, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_owner!, except: [:index, :show]
	before_action :check_owner

	def new #restaurants/index.html
		@restaurant = Restaurant.new
	end

	def create
		@restaurant = current_owner.restaurants.new(params.require(:restaurant).permit(:name, :phone, :address, :genre, :photo))

		@restaurant.owner = current_owner
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
		if @restaurant.update(params.require(:restaurant).permit(:name,:phone,:address,:genre, :photo))
			redirect_to @restaurant
		else
			render 'edit'
		end
	end

	def show
		@restaurant = Restaurant.find(params[:id])
	end

	def index
		if current_owner
			@restaurants = current_owner.restaurants
		else
			@restaurants = Restaurant.all
		end
	end

private
def set_restaurant
	@restaurant = Restaurant.find(params[:id])
end

def check_owner
	if @restaurant
		redirect_to :restaurants, notice: 'This is not your restaurant.' if(@restaurant.owner!=current_owner) end
	end
end
