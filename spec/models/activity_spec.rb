require 'rails_helper'

RSpec.describe Activity, type: :model do
  describe "validations" do 
    it { should validate_presence_of(:high) }
    it { should validate_presence_of(:low) }
    it { should validate_presence_of(:sky) }
    it { should validate_presence_of(:title) }
  end 

  describe "relationships" do
    it { should respond_to(:user) } 
  end
end
