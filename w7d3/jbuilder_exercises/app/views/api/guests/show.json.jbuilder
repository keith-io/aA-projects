# json.extract! @guest, :name, :age, :favorite_color

# key of guest: comes from the first line of the partial
# where we extract 'guest'
json.partial! "api/guests/guest", guest: @guest