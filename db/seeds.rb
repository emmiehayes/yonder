require 'csv'

ActiveRecord::Base.connection.reset_pk_sequence!('locations')

path = Rails.root.join('lib', 'seeds', "coloradocities.csv")

CSV.foreach(path, headers: true, header_converters: :symbol).with_index do |row, index|
  Location.create(city:row[0], state_abbr:row[1], latitude:row[3], longitude:row[4])
end

mountain_biking = Activity.create(title: "Mountain Biking")
trail_hiking = Activity.create(title: "Trail Hiking")

puts Location.count puts 'locations'


