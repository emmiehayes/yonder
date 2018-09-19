class ApixuWeatherService

  def initialize(params)
    @location =  Location.find(params[:location][:id].to_i)
  end

  def raw_current
    JSON.parse(response.body, symbolize_names: true)[:current]
  end

  def raw_forecast
    JSON.parse(response.body, symbolize_names: true)[:forecast][:forecastday]
  end

  private 
  attr_reader :location
  
  def response 
    conn.get("/v1/forecast.json?key=#{ENV['APIXU_API_KEY']}&q=#{@location.latitude},#{@location.longitude}&days=5")
  end

  def conn 
    Faraday.new(url: 'http://api.apixu.com') do |faraday|
      faraday.adapter Faraday.default_adapter
    end
  end
end

