namespace :call do
  desc "MAKE SHOPS API CALL"
  task shops: :environment do
    
    @locations = Location.all
    @conn = Faraday.new(url: "https://api.yelp.com") do |faraday|
      faraday.headers['Authorization'] = "Bearer #{ENV['YELP_API_KEY']}"
      faraday.adapter Faraday.default_adapter
    end 

    @locations.each do |location|
      response = @conn.get("/v3/businesses/search?latitude=#{location.latitude}&longitude=#{location.longitude}&limit=5&term=bike")
      bike_shops = JSON.parse(response.body, symbolize_names: true)[:businesses]
    
      bike_shops.map do |shop|
        unless Shop.find_by_sid(shop[:id])
        Shop.create(
          sid: shop[:id], 
          name: shop[:name], 
          address: shop[:location][:address1],
          phone: shop[:display_phone],
          price: shop[:price],
          latitude: shop[:coordinates][:latitude],
          longitude: shop[:coordinates][:longitude], 
          url: shop[:url]
          )
        end
      end
    end
  end
end

