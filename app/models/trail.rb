class Trail 
  attr_reader :name, :length, :location, :ascent, :descent, :highest_point, :lowest_point
  def initialize(trail_data)
    @name = trail_data[:name]
    @length = trail_data[:length]
    @location = trail_data[:location]
    @ascent = trail_data[:ascent]
    @descent = trail_data[:descent]
    @highest_point = trail_data[:high]
    @lowest_point = trail_data[:low]
  end
end