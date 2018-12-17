# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Artwork.destroy_all
ArtworkShare.destroy_all

user1 = User.create(username: 'Luke')
user2 = User.create(username: 'Guy')
user3 = User.create(username: 'Dude')
user4 = User.create(username: 'Example')

user1.artworks.create(title: 'blue')
user2.artworks.create(title: 'red')
user3.artworks.create(title: 'yellow')
user4.artworks.create(title: 'green')