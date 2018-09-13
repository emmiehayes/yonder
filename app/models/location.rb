class Location < ApplicationRecord
  validates_presence_of :city, :state_abbr, :latitude, :longitude

  def city_state
    "#{city}, #{state_abbr}"
  end

  def lat_long
    "#{latitude}, #{longitude}"
  end
end
