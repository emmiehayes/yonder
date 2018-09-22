# README

Yonder consumes three APIs: MTB Project, APIXU Weather, & Yelp to make trail and gear shop recommendations based on user location search.  All recommendations are plotted on a map and users can send invitation alerts via SMS using Twilio.  This was a solo project that I managed over 2 weeks, from wireframes through deployment.

<img alt="yonder-screen" src="https://cl.ly/2c882211f0e4/Screen%20Shot%202018-09-22%20at%201.38.32%20PM.jpg">


Production App: https://yonder-go.herokuapp.com

- Ruby Version: 2.4.1

- Rails Version: 5.1.5

Setup
 
```ruby
git clone git@github.com:emmiehayes/yonder.git
cd yonder
bundle install
rake db:{create,migrate,seed}
rake call:trails
rake call:shops
rails s
```

Testing

- This project uses RSpec along with Webmock and Capybara for testing and can be run with the command `rspec`
- You may need to rake db:test:prepare before running the tests.

Technologies:

- Mapbox
- Geocoding
- Twilio
- Google OAuth2
- Heroku
- Bulma
