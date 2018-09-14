class OpenWeatherService 

  def initialize(trail_data)
    @trail_lat  = trail_data[:latitude]
    @trail_long = trail_data[:longitude]
  end

  def raw_current
    JSON.parse(current_response.body, symbolize_names: true)[:main]
  end

  def raw_forecast
    JSON.parse(forecast_response.body, symbolize_names: true)[:list]
  end

  private 
  attr_reader :trail_lat, :trail_long

  def current_response 
    conn.get("/data/2.5/weather?lat=#{@trail_lat}&lon=#{@trail_long}&units=imperial&appid=#{ENV['WEATHER_API_KEY']}")
  end

  def forecast_response 
    conn.get("/data/2.5/forecast?lat=#{@trail_lat}&lon=#{@trail_long}&units=imperial&appid=#{ENV['WEATHER_API_KEY']}")
  end

  def conn 
    Faraday.new(url: "http://api.openweathermap.org") do |faraday|
      faraday.adapter Faraday.default_adapter
    end
  end
end