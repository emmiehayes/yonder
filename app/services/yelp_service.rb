class YelpService < Service

  def raw_gear_shops
   parse[:businesses]
  end

  private

  def response 
    conn.get("/v3/businesses/search?latitude=#{@location.latitude}&longitude=#{@location.longitude}&limit=5&term=bike")
  end

  def conn 
    Faraday.new(url: "https://api.yelp.com") do |faraday|
      faraday.headers["Authorization"] = "Bearer #{ENV['YELP_API_KEY']}"
      faraday.adapter Faraday.default_adapter
    end
  end
end

