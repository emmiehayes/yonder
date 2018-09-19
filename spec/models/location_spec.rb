require 'rails_helper'

RSpec.describe Location, type: :model do
   describe "validations" do 
    it { should validate_presence_of(:city) }
    it { should validate_presence_of(:state) }
    it { should validate_presence_of(:latitude) }
    it { should validate_presence_of(:longitude) }
  end 

  describe "instance methods" do
    it ".select_format" do 
      location = create(:location)
      expect(location.select_format).to eq("Breckenridge, Colorado")
    end

    it ".long_lat" do 
      location = create(:location)
      expect(location.lat_long).to eq("39.4997, -106.0433")
    end
  end
end

