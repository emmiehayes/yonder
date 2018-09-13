class SearchPresenter 

  def initialize(params) 
    @service = MtbProjectService.new(params)
  end
  
  def trails_in_range 
    @service.raw_trails.map do |trail|
      Trail.new(trail)
    end
  end
end