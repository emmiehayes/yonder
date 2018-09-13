require 'rails_helper'

RSpec.describe Pin, type: :model do
  describe "validations" do 
    it { should validate_presence_of(:city) }
    it { should validate_presence_of(:state) }
    it { should validate_presence_of(:longitude) }
    it { should validate_presence_of(:latitude) }
  end 

  describe "relationships" do
    it { should have_many(:activities).through(:activity_pins) } 
  end
end
