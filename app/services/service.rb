class Service 

  def initialize(params)
    @location = Location.find(params[:location][:id].to_i)
    @activity = Activity.find(params[:activity][:id].to_i)
  end

  def parse 
    JSON.parse(response.body, symbolize_names: true)
  end
end