require 'rails_helper'

RSpec.describe Activity, type: :model do
  describe "validations" do 
    it { should validate_uniqueness_of(:title) }
  end 

  describe "relationships" do
    it { should have_many(:pins).through(:activity_pins) } 
  end
end
