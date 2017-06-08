class AddAttachmentPhotoToRestaurants < ActiveRecord::Migration[5.1]
  def self.up
    change_table :restaurants do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :restaurants, :photo
  end
end
