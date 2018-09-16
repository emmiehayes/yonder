module Helpers
  module StubApi  
  
    def stub_bike
      json_response_mtb = File.open('./fixtures/bike_trails.json')
      stub_request(:get, "https://www.mtbproject.com/data/get-trails?lat=#{location.latitude}&lon=#{location.longitude}&maxDistance=10&maxResults=5&sort=distance&key=#{ENV['MTB_API_KEY']}").to_return(status: 200, body: json_response_mtb)
    end 

    def stub_hike
      json_response_hike = File.open('./fixtures/hike_trails.json')
      stub_request(:get, "https://www.hikingproject.com/data/get-trails?lat=#{location.latitude}&lon=#{location.longitude}&maxDistance=10&maxResults=5&sort=distance&key=#{ENV['MTB_API_KEY']}").to_return(status: 200, body: json_response_hike)
    end

    def stub_weather
      json_response_weather = File.open('./fixtures/weather_forecast.json')
      stub_request(:get, "http://api.apixu.com/v1/forecast.json?key=#{ENV['APIXU_API_KEY']}&q=#{location.latitude},#{location.longitude}&days=5").to_return(status: 200, body: json_response_weather)
    end 

    def stub_shops
      json_response_gear = File.open('./fixtures/gear_shops.json')
      stub_request(:get, "https://api.yelp.com/v3/businesses/search?latitude=#{location.latitude}&longitude=#{location.longitude}&limit=5&term=bike").to_return(status: 200, body: json_response_gear)
    end
  end
end