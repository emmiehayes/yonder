class Trail < ApplicationRecord
  validates_presence_of :name, :location, :length, :difficulty, :elevation_high, :elevation_low, :latitude, :longitude
  belongs_to :activity
end