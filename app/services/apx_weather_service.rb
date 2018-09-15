class ApxWeatherService < Service

  def raw_current
    parse[:current]
  end

  def raw_forecast
    parse[:forecast][:forecastday]
  end

  private 

  def response 
    conn.get("/v1/forecast.json?key=#{ENV['APIXU_API_KEY']}&q=#{@location.latitude},#{@location.longitude}&days=5")
  end

  def conn 
    Faraday.new(url: "http://api.apixu.com") do |faraday|
      faraday.adapter Faraday.default_adapter
    end
  end
end

