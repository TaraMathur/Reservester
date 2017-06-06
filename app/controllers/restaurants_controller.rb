class RestaurantsController < ApplicationController
	before_action :set_restaurant, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_owner!, except: [:index, :show]

	def new #restaurants/index.html
	end

	def create
		@restaurant = current.owner.restaurants.new(params.require(:restaurant).permit(:name, :phone, :address, :genre))

		@restaurant.owner = current_owner
		if @restaurant.save
			redirect_to @restaurant #restaurants/id (shows)
		else
			render 'new'
		end
	end

	def edit
		#i'm getting an error here
		@restaurant = Restaurant.find(params[:id])
	end

	def destroy
		Restaurant.find(params[:id]).delete
		redirect_to restaurants_path
     end

	def update
		@restaurant = Restaurant.find(params[:id])
		if @restaurant.update(params.require(:restaurant).permit(:name,:phone,:address,:genre))
			redirect_to @restaurant
		else
			render 'edit'
		end
	end

	def show
		@restaurant = Restaurant.find(params[:id])
	end

	def index
		@restaurants = Restaurant.all
	end

private
def set_restaurant
	@restaurant = Restaurant.find(params[:id])
end

def check_owner
	if restaurant.owner != current_owner 
		redirect_to(restaurants_url, notice: 'This is not your restaurant.')
	end
end

end
