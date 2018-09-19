FactoryBot.define do
  factory :trail do
    tid             { Faker::Number.number(5) }
    name            { Faker::StarWars.character }
    location        { Faker::Address.city }
    length          { Faker::Number.number(2).to_s }
    elevation_high  { Faker::Number.number(5).to_s  }
    elevation_low   { Faker::Number.number(5).to_s  }
    latitude        { Faker::Address.latitude }
    longitude       { Faker::Address.longitude }
    created_at      { Faker::Time.between(2.days.ago, Time.now, :all) }
    updated_at      { Faker::Time.between(2.days.ago, Time.now, :all) }
  end
end
