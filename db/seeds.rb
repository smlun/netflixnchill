# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'ffaker'

1000.times do
  Movie.create(title: FFaker::Movie.title,
               starring: FFaker::Name.female_name_with_prefix,
               price: rand(20.0..120.0).round(2),
               description: FFaker::CheesyLingo.sentence,
               stock: rand(0..100)
              )
end
