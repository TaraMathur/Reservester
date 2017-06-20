class RemoveTimeAndAddDatetimeToReservation < ActiveRecord::Migration[5.1]
  def change
  	 remove_column :reservations, :time
  	 add_column :reservations, :datetime, :datetime
  end
end
