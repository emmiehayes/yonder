class Shop < ApplicationRecord 
  reverse_geocoded_by :latitude, :longitude
  validates_presence_of :sid, :name, :address, :phone, :price, :url, :longitude, :latitude
end