class SearchPresenter 

  def initialize(params) 
    @trail_service = MtbProjectService.new(params)
    @gear_shop_service = YelpService.new(params)
    @condition_service = ApxWeatherService.new(params)
    @location = Location.find(params[:location][:id].to_i)
  end

  def city_state 
    "#{@location.city}, #{@location.state_abbr}"
  end

  def current_city_weather
    @condition_service.raw_current
  end
  
  def forecasted_city_weather
    @condition_service.raw_forecast.map do |day|
      Condition.new(day)
    end
  end

   def trails_in_range 
    @trail_service.raw_trails.map do |trail|
      Trail.new(trail)
    end
  end

  def gear_in_range
    @gear_shop_service.raw_gear_shops.map do |shop|
      GearShop.new(shop)
    end
  end

  private 
  attr_reader :trail_service, :gear_shop_service, :condition_service, :location
end