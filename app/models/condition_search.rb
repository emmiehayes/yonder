class ConditionSearch

  def initialize(trail_data)
    @service = OpenWeatherService.new(trail_data)
  end
  
  def current 
    @service.raw_current[:temp]
  end

  def extended
    @service.raw_forecast.map do |condition|
      Condition.new(condition)
    end
  end

  def format_next_day
    @day_1 = extended[0].date 
    extended.keep_if do |condition|
      condition.date == @day_1 && condition.best_time?
    end 
  end

  private 
  attr_reader :service
end