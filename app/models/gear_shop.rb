class GearShop

  def initialize(shop)
    @shop = shop
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

  private 
  attr_reader :shop
end