# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
CatRentalRequest.destroy_all

request1 = CatRentalRequest.create!(cat_id: 4, start_date: Date.today, end_date: Date.tomorrow, status: 'APPROVED')
request2 = CatRentalRequest.create!(cat_id: 4, start_date: Date.today + 2, end_date: Date.tomorrow + 2, status: 'APPROVED')
# request1 = CatRentalRequest.new(cat_id: 4, start_date: Date.today, end_date: Date.tomoorrow, status: 'APPROVED')
# request1 = CatRentalRequest.new(cat_id: 4, start_date: Date.today, end_date: Date.tomoorrow, status: 'APPROVED')
# request1 = CatRentalRequest.new(cat_id: 4, start_date: Date.today, end_date: Date.tomoorrow, status: 'APPROVED')
# request1 = CatRentalRequest.new(cat_id: 4, start_date: Date.today, end_date: Date.tomoorrow, status: 'APPROVED')
