# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
ShortenedUrl.destroy_all
Visit.destroy_all

bob = User.new(email: "bob@bob.com")
rick = User.new(email: "rick@morty.com")

bob.save!
rick.save!

s1 = ShortenedUrl.new(long_url: 'www.google.com', short_url: "Jdr4gnSlVm8N2VJmVNIs7w", user_id: bob.id)
s2 = ShortenedUrl.new(long_url: 'www.youtube.com', short_url: "q6wq4x2B6_XaD-5Sor1v4g", user_id: rick.id)
s1.save!
s2.save!

visit1 = Visit.new(user_id: bob.id, shortened_url_id: s1.id)
visit2 = Visit.new(user_id: bob.id, shortened_url_id: s2.id)

visit1.save!
visit2.save!