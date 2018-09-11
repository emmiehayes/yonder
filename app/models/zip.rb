class Zip 
  attr_reader :city, :state, :zipcode, :distance
  
  def initialize(zipcode_data)
    @zipcode = zipcode_data[:zip_code]
    @city = zipcode_data[:city]
    @state = zipcode_data[:state]
    @distance = zipcode_data[:distance]
  end
end