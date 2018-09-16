class Condition 

  def initialize(condition_data)
    @condition = condition_data
  end

  def day 
    @condition[:date].to_datetime.strftime('%A')
  end

  def date 
    @condition[:date].to_datetime.strftime('%b %d')
  end

  def temp_min 
    @condition[:day][:mintemp_f].round
  end 

  def temp_max 
    @condition[:day][:maxtemp_f].round
  end 

  def humidity
    @condition[:day][:avghumidity].round
  end

  def description 
    @condition[:day][:condition][:text]
  end
  
  def max_winds 
    @condition[:day][:maxwind_mph]
  end

  def icon 
    path = (@condition[:day][:condition][:icon])
    path.slice!('//cdn.apixu.com/') 
    path
  end

  private 
  attr_reader :condition
end

  