namespace :call do
  desc "MAKE TRAIL API CALLS"
  task trails: :environment do

    @locations = Location.all
    
    conn = Faraday.new(url: "https://www.mtbproject.com") do |faraday|
      faraday.adapter Faraday.default_adapter
    end 

    @locations.each do |location|
      response = conn.get("/data/get-trails?lat=#{location.latitude}&lon=#{location.longitude}&maxResults=20&maxDistance=45&key=#{ENV['MTB_API_KEY']}")
      bike_trails = JSON.parse(response.body, symbolize_names: true)[:trails]
      bike_trails.map do |trail|
        unless Trail.find_by_tid(trail[:id])
        Trail.create(
          tid: trail[:id], 
          name: trail[:name], 
          location: trail[:location], 
          length: trail[:length], 
          elevation_high: trail[:high], 
          elevation_low: trail[:low], 
          latitude: trail[:latitude], 
          longitude: trail[:longitude]
          )
        end
      end
    end
  end 
end