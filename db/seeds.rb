require 'csv'

ActiveRecord::Base.connection.reset_pk_sequence!('locations')

path = Rails.root.join('lib', 'seeds', 'coloradocities.csv')

CSV.foreach(path, headers: true, header_converters: :symbol).with_index do |row, index|
  Location.create(city:row[0], state:row[2], latitude:row[3], longitude:row[4])
end

mountain_biking = Activity.create(title: 'Mountain Biking')

puts Location.count puts 'locations'


