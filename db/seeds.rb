# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

activity_1 = Activity.create(title: "Mountain Biking")
pin_1 = Pin.create(city: "Fruita", state: "Colorado", latitude: 39.1589, longitude: 108.7290)
activity_pin_1 = ActivityPin.create(activity_id: 1, pin_id: 1)

activity_2 = Activity.create(title: "Rock Climbing")
pin_2 = Pin.new(city: "Golden", state: "Colorado", latitude: 39.7555, longitude: 105.2211)
activity_pin_2 = ActivityPin.create(activity_id: 2, pin_id: 2)

activity_3 = Activity.create(title: "Hiking")
pin_3 = Pin.new(city: "Boulder", state: "Colorado", latitude: 40.0150, longitude: 105.2705)
activity_pin_3 = ActivityPin.create(activity_id: 3, pin_id: 3)


activity_4 = Activity.create(title: "Skiing")
pin_4 = Pin.new(city: "Breckenridge", state: "Colorado", latitude: 39.4817, longitude: 106.0384)
activity_pin_4 = ActivityPin.create(activity_id: 4, pin_id: 4)

