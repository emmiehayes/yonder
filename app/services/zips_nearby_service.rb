class ZipsNearbyService 

  def initialize(zipcode)
    @zipcode = zipcode
  end

  def raw_zip_codes
    JSON.parse(response.body, symbolize_names: true)[:zip_codes]
  end
  
  def response
    conn.get("/rest/#{ENV["ZIP_CODE_API_KEY"]}/radius.json/#{@zipcode}/#{distance}/mile")
  end
  
  private
  attr_reader :zipcode
  
  def distance
    60
  end
  
  def conn
    Faraday.new("https://www.zipcodeapi.com") do |faraday|
      faraday.adapter  Faraday.default_adapter
    end
  end
end