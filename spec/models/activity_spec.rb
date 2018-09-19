require 'rails_helper'

RSpec.describe Activity, type: :model do
  describe "validations" do 
    it { should validate_uniqueness_of(:title) }
  end 
end
