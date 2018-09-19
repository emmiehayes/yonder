class Trail < ApplicationRecord
  reverse_geocoded_by :latitude, :longitude
  validates_uniqueness_of :tid
  validates_presence_of :name, :location, :length, :elevation_high, :elevation_low, :latitude, :longitude
end

