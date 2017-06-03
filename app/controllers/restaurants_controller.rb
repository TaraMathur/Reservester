class RestaurantsController < ApplicationController
	def new #restaurants/index.html
	end

	def create
		@restaurant = Restaurant.new(params.require(:restaurant).permit(:name, :phone, :address, :genre))
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


end
