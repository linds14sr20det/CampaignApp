# Create Locations and Armies. These shouldn't change after initial deploy

easternport = Location.find_or_initialize_by(name: "Eastern Port")
easternport.id = 1
easternport.name = "Eastern Port"
easternport.save!

spaceport = Location.find_or_initialize_by(name: "Space Port")
spaceport.id = 2
spaceport.name = "Space Port"
spaceport.save!

mesaprime = Location.find_or_initialize_by(name: "Mesa Prime")
mesaprime.id = 3
mesaprime.name = "Mesa Prime"
mesaprime.save!

habblocks = Location.find_or_initialize_by(name: "Hab Blocks")
habblocks.id = 4
habblocks.name = "Hab Blocks"
habblocks.save!

oldcity = Location.find_or_initialize_by(name: "Old City")
oldcity.id  = 5
oldcity.name = "Old City"
oldcity.save!

ucm = Army.find_or_initialize_by(name: "UCM")
ucm.name = "UCM"
ucm.color = "489346"
ucm.save!

scourge = Army.find_or_initialize_by(name: "Scourge")
scourge.name = "Scourge"
scourge.color = "b135ba"
scourge.save!

phr = Army.find_or_initialize_by(name: "PHR")
phr.name = "PHR"
phr.color = "49c2ff"
phr.save!

shaltari = Army.find_or_initialize_by(name: "Shaltari")
shaltari.name = "Shaltari"
shaltari.color = "ff6600"
shaltari.save!

resistance = Army.find_or_initialize_by(name: "Resistance (Feral)")
resistance.name = "Resistance (Feral)"
resistance.color = "bc1200"
resistance.save!

resistance1 = Army.find_or_initialize_by(name: "Resistance (Allied)")
resistance1.name = "Resistance (Allied)"
resistance1.color = "bbf9bf"
resistance1.save!

admin = User.find_or_initialize_by(email:  "stephen.r.lind@gmail.com")
admin.name = "Stephen Lind"
admin.password_digest = "$2a$10$PqFahHZF9YMvu4J5mMMnE.z0g9rYUsJ4dwRcF4dhyO7NpOXuOmS/O"
admin.admin = true
admin.activated = true
admin.activated_at = Time.zone.now
admin.save!

# Create a bunch of test accounts

# 99.times do |n|
#   name  = Faker::Name.name
#   email = "example-#{n+1}@railstutorial.org"
#   password = "password"
#   User.create!(name:  name,
#                email: email,
#                password:              password,
#                password_confirmation: password,
#                activated: true,
#                activated_at: Time.zone.now)
# end
#
# users = User.order(:created_at).take(6)
# location = Location.first
# user_army1 = Army.find(1)
# opponent_army1 = Army.find(2)
# user_army2 = Army.find(3)
# opponent_army2 = Army.find(4)
#
# 25.times do
#   users.each { |user| user.games.create!(win: true, location_id: location.id, user_army_id: user_army1.id, opponent_army_id: opponent_army1.id) }
# end
#
# 25.times do
#   users.each { |user| user.games.create!(win: true, location_id: location.id, user_army_id: user_army2.id, opponent_army_id: opponent_army2.id) }
# end