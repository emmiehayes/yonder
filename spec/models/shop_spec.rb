require 'rails_helper'

RSpec.describe Shop, type: :model do
  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:location) }
    it { should validate_presence_of(:phone) }
    it { should validate_presence_of(:price) }
    it { should validate_presence_of(:latitude) }
    it { should validate_presence_of(:longitude) }
  end

  describe "relationships" do
    it { should belong_to(:activity) }
  end
end
