class ReservationsController < ApplicationController
	#before_action :set_restaurant, only: [:show, :edit, :update, :destroy]

def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @reservation = @restaurant.reservations.create(reservation_params)
    byebug
    if verify_recaptcha(@reservation)
	    OwnerMailer.reservation_confirmation_email(@restaurant,@reservation).deliver_later
	#    redirect_to restaurant_reservation_path(@restaurant)
	#    redirect_to restaurant_path(@restaurant)
		confirm(@restaurant,@reservation)
	else
		redirect_to @restaurant, notice: "You're a robot :c  No reservation was made"
	end
end

def new
	@restaurant = Restaurant.find(params[:restaurant_id])
	@reservation = @restaurant.reservations.new
end

def index
	@restaurant = Restaurant.find(params[:restaurant_id])
	@reservation = @restaurant.reservations.all
end
 
def show
	@restaurant = Restaurant.find(params[:restaurant_id])
	@reservation = @restaurant.reservations.all
end

def destroy
	@restaurant = Restaurant.find(params[:restaurant_id])
	@reservation = @restaurant.reservation.find(params[:id])
	@reservation.destroy
	redirect_to restaurant_path(@restaurant)
end

def confirm(restaurant,reservation)
	@restaurant = restaurant
	@reservation = reservation
	render 'confirm'
end

private

def reservation_params
    params.require(:reservation).permit(:user, :datetime)
end
end
