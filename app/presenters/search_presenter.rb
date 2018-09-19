class SearchPresenter 
  def initialize(params) 
    @location = Location.find(params[:location][:id].to_i)
    @service = WeatherService.new(params)
  end

  def city_state 
    "#{@location.city}, #{@location.state}"
  end

  def longitude
    @location.longitude
  end
  
  def latitude 
    @location.latitude
  end

  def current_city_weather
    @service.raw_current
  end
  
  def forecasted_city_weather
    @service.raw_forecast.map do |day|
      Condition.new(day)
    end
  end

  def trails_in_range
    Trail.near([@location.latitude,@location.longitude], 30).limit(5)
  end

  def gear_in_range
    Shop.near([@location.latitude,@location.longitude], 30).limit(5)
  end

  private
  attr_reader :location, :service
end