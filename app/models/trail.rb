class Trail 

  def initialize(trail_data)
    @trail = trail_data
  end
  
  def name 
    @trail[:name]
  end 
  
  def length 
    @trail[:length]
  end
  
  def location 
    @trail[:location]
  end 
  
  def ascent 
    @trail[:ascent].to_s(:delimited)  
  end 
  
  def descent 
    @trail[:descent].to_s(:delimited)  
  end 
  
  def highest_point 
    @trail[:high].to_s(:delimited)  
  end 
  
  def lowest_point 
    @trail[:low].to_s(:delimited)  
  end 

  def latitude
    @trail[:latitude].to_f
  end 

  def longitude
    @trail[:longitude].to_f
  end
  
  private 
  attr_reader :trail
end