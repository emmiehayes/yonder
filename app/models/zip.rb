class Zip 
  attr_reader :city, :state, :zipcode
  
  def initialize(zipcode_data)
    @zipcode = zipcode_data[:zip_code]
    @city = zipcode_data[:city]
    @state = zipcode_data[:state]
  end
end