class MtbProjectService < Service

  def raw_trails
    parse[:trails]
  end

  private 

  def response 
    conn.get("/data/get-trails?lat=#{@location.latitude}&lon=#{@location.longitude}&maxDistance=10&maxResults=5&sort=distance&key=#{ENV['MTB_API_KEY']}")
  end

  def conn 
    Faraday.new(url: "https://www.mtbproject.com") do |faraday|
      faraday.adapter Faraday.default_adapter
    end
  end
end