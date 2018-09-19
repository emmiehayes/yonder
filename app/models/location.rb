class Location < ApplicationRecord
  validates_presence_of :city, :state, :latitude, :longitude

  def select_format
    "#{city}, #{state}"
  end

  def lat_long
    "#{latitude}, #{longitude}"
  end
end
