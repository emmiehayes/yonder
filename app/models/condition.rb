class Condition 
  attr_reader :temp_min, :temp_max, :humidity, :description, :winds, :date, :current_temp

  def initialize(condition)
    @condition = condition
  end

  def current_temp
    @condition[1]
  end

  def date 
    @condition[:dt_txt].to_datetime.strftime("%A %B %d, %Y")
  end

  def time 
    @condition[:dt_txt].to_datetime.strftime("%I:%M %p")
  end

  def best_time?
    ["06:00 AM","12:00 PM","06:00 PM"].include?(time)
  end

  def temp_min 
    @condition[:main][:temp_min].round
  end 

  def temp_max 
    @condition[:main][:temp_max].round
  end 

  def humidity
    @condition[:main][:humidity]
  end

  def description 
    @condition[:weather][0][:description]
  end
  
  def winds 
    @condition[:wind][:speed].round
  end

  private 
  attr_reader :condition
end

  