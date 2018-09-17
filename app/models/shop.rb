class Shop < ApplicationRecord 
  validates_presence_of :name, :location, :phone, :price, :longitude, :latitude
  belongs_to :activity
end

  