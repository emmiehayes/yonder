FactoryBot.define do
  factory :shop do
    sid             { Faker::Number.number(5) }
    name            { Faker::StarWars.character }
    address         { Faker::Address.city }
    phone           { Faker::PhoneNumber.cell_phone }
    price           { '$$$' }
    latitude        { Faker::Address.latitude }
    longitude       { Faker::Address.longitude }
    url             { Faker::Internet.url }
    created_at      { Faker::Time.between(2.days.ago, Time.now, :all) }
    updated_at      { Faker::Time.between(2.days.ago, Time.now, :all) }    
  end
end
