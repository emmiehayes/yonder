FactoryBot.define do
  factory :user do
    provider         { "google_oauth2" }
    uid              { Faker::Number.number(10) }
    email            { Faker::Internet.email }
    first_name       { Faker::StarWars.character }
    last_name        { Faker::StarWars.character }
    token            { Faker::Number.number(10) }
    refresh_token    { Faker::Number.number(10) }
    oauth_expires_at { Faker::Time.between(2.days.ago, Time.now, :all) }
  end
end