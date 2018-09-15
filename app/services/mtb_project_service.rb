class MtbProjectService 

  def initialize(params)
    @location = Location.find(params[:location][:id].to_i)
    @activity = Activity.find(params[:activity][:id].to_i)
  end

  def raw_trails
    JSON.parse(response.body, symbolize_names: true)[:trails]
  end

  private 
  attr_reader :location, :activity

  def response 
    conn.get("/data/get-trails?lat=#{@location.latitude}&lon=#{@location.longitude}&maxDistance=10&maxResults=5&sort=distance&key=#{ENV['MTB_API_KEY']}")
  end

  def conn 
    Faraday.new(url: "https://www.mtbproject.com") do |faraday|
      faraday.adapter Faraday.default_adapter
    end
  end
end