class SearchPresenter 

  def initialize(params) 
    @trail_service = MtbProjectService.new(params)
    @gear_shop_service = YelpService.new(params)
  end
  
  def trails_in_range 
    @trail_service.raw_trails.map do |trail|
      Trail.new(trail)
    end
  end

  def gear_in_range
    @gear_shop_service.raw_gear_shops.map do |shop|
      GearShop.new(shop)
    end
  end

  private 
  attr_reader :trail_service, :gear_shop_service
end