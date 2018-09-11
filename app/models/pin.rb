class Pin < ApplicationRecord
  validates_presence_of :city, :state, :latitude, :longitude 
  has_many :activity_pins
  has_many :activities, through: :activity_pins
end
