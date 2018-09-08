FactoryBot.define do
  factory :activity do
    title { Faker::StarWars.character }
    high { Faker::Base::rand_in_range(70, 90) }
    low { Faker::Base::rand_in_range(50, 69) }
    sky { 'sunny' }
  end
end
