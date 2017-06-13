class ReservationsController < ApplicationController
	def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @reservation = @restaurant.reservations.create(reservation_params)
    redirect_to restaurant_path(@restaurant)
  	end

  #	def new
#	    @restaurant = Restaurant.find(params[:restaurant_id])
#	  	@reservation = @restaurant.reservations.new
#	 end
 
 	def destroy
	 	@restaurant = Restaurant.find(params[:restaurant_id])
	    @reservation = @restaurant.reservation.find(params[:id])
	    @reservation.destroy
	    redirect_to restaurant_path(@restaurant)
	 	end

  private
    def reservation_params
      params.require(:reservation).permit(:user, :time)
    end
end
