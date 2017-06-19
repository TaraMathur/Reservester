class ReservationsController < ApplicationController
	#before_action :set_restaurant, only: [:show, :edit, :update, :destroy]

	def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @reservation = @restaurant.reservations.create(reservation_params)
     # Tell the UserMailer to send a welcome email after save
        UserMailer.reservation_confirmation_email(@restaurant,@reservation).deliver_later
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
