class YelpService 

  def initialize(params)
    @location = Location.find(params[:location][:id].to_i)
    @activity = Activity.find(params[:activity][:id].to_i)
  end

  def raw_gear_shops
    JSON.parse(response.body, symbolize_names: true)[:businesses]
  end

  private 
  attr_reader :location, :activity

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

