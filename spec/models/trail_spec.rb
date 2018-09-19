require 'rails_helper'

RSpec.describe Trail, type: :model do
  describe "validations" do
    it { should validate_uniqueness_of(:tid) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:location) }
    it { should validate_presence_of(:length) }
    it { should validate_presence_of(:elevation_high) }
    it { should validate_presence_of(:elevation_low) }
    it { should validate_presence_of(:latitude) }
    it { should validate_presence_of(:longitude) }
  end
end
