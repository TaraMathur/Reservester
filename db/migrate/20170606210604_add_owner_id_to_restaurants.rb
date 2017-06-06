class AddOwnerIdToRestaurants < ActiveRecord::Migration[5.1]
  def change
    add_column :restaurants, :owner_id, :integer
  end
end
