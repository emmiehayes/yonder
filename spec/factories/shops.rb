FactoryBot.define do
  factory :shop do
    name            { Faker::StarWars.character }
    location        { Faker::Address.city }
    phone           { Faker::PhoneNumber.cell_phone }
    price           { '$$$' }
    latitude        { Faker::Address.latitude }
    longitude       { Faker::Address.longitude }
    created_at      { Faker::Time.between(2.days.ago, Time.now, :all) }
    updated_at      { Faker::Time.between(2.days.ago, Time.now, :all) }
    activity
  end
end
