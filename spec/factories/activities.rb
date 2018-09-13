FactoryBot.define do
  factory :activity do
    title { Faker::Superhero.name }
  end
end
