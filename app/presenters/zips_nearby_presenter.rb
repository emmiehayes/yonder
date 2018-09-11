class ZipsNearbyPresenter
  attr_reader :zips_that_match

  def initialize(zipcode)
    @zipcode = zipcode
  end

  def zips_that_match
    service.raw_zip_codes.map do |zipcode|
      Zip.new(zipcode)
    end
  end

  private 
  attr_reader :zipcode
  
  def service
    ZipsNearbyService.new(zipcode)
  end
end
  
  