class AddOwnerToRestaurants < ActiveRecord::Migration[5.1]
  def change
  		add_reference :restaurants, :owner, index:true
  		add_foreign_key :restaurants, :owners
  end
end
