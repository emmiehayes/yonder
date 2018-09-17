class GearShop

  def initialize(shop_data)
    @shop = shop_data
  end

  def name
    @shop[:name]
  end

  def phone_number
    @shop[:phone]
  end

  def address 
    @shop[:location][:display_address][0]
  end

  def url
    @shop[:url]
  end

  def latitude
    @shop[:coordinates][:latitude]
  end 

  def longitude
    @shop[:coordinates][:longitude]
  end

  private 
  attr_reader :shop
end