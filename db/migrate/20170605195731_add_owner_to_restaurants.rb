class AddOwnerToRestaurants < ActiveRecord::Migration[5.1]
  def change
  		add_foreign_key :restaurants, :owner
  		add_reference :restaurants, :owner, index:true
  end
end
