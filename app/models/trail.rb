class Trail 

  def initialize(trail_data)
    @trail_data = trail_data
  end
  
  def name 
    trail_data[:name]
  end 
  
  def length 
    trail_data[:length]
  end
  
  def location 
    trail_data[:location]
  end 
  
  def ascent 
    trail_data[:ascent]
  end 
  
  def descent 
    trail_data[:descent]
  end 
  
  def highest_point 
    trail_data[:high]
  end 
  
  def lowest_point 
    trail_data[:low]
  end 

  def conditions 
    ConditionSearch.new(trail_data)
  end
  
  private 
  attr_reader :trail_data
end