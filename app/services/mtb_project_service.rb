class MtbProjectService < Service

  def raw_trails
    parse[:trails]
  end

  private 

  def response 
    conn.get("/data/get-trails?lat=#{@location.latitude}&lon=#{@location.longitude}&maxDistance=10&maxResults=5&sort=distance&key=#{ENV['MTB_API_KEY']}")
  end

  def conn
    Faraday.new(url: url) do |faraday|
      faraday.adapter Faraday.default_adapter
    end
  end

  def url
    if @activity.title == 'Mountain Biking'
      'https://www.mtbproject.com'
    elsif @activity.title == 'Trail Hiking'
      'https://www.hikingproject.com' 
    end
  end
end
