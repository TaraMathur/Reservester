class UserMailer < ApplicationMailer
  default from: 'taramathur@gmail.com'
 
  def welcome_email(user)
    @user = user
    @url  = 'http://example.com/login'
  end

  def reservation_confirmation_email(restaurant,reservation)
  	@restaurant = restaurant
  	@owner = @restaurant.owner
  	@reservation = reservation
  	@time = reservation.time
  	mail(to: @owner.email, subject: 'A new reservation has been made.')
  end
end
