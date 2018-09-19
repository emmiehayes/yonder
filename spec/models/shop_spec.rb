require 'rails_helper'

RSpec.describe Shop, type: :model do
  describe "validations" do
    it { should validate_presence_of(:sid) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:address) }
    it { should validate_presence_of(:phone) }
    it { should validate_presence_of(:price) }
    it { should validate_presence_of(:latitude) }
    it { should validate_presence_of(:longitude) }
    it { should validate_presence_of(:url) }
  end
end
