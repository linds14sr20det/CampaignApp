# Create Locations and Armies. These shouldn't change after initial deploy

easternport = Location.find_or_initialize_by(name: "Eastern Port")
easternport.name = "Eastern Port"
easternport.save!

spaceport = Location.find_or_initialize_by(name: "Space Port")
spaceport.name = "Space Port"
spaceport.save!

mesaprime = Location.find_or_initialize_by(name: "Mesa Prime")
mesaprime.name = "Mesa Prime"
mesaprime.save!

habblocks = Location.find_or_initialize_by(name: "Hab Blocks")
habblocks.name = "Hab Blocks"
habblocks.save!

oldcity = Location.find_or_initialize_by(name: "Old City")
oldcity.name = "Old City"
oldcity.save!

ucm = Army.find_or_initialize_by(name: "UCM")
ucm.name = "UCM"
ucm.color = "green"
ucm.save!

scourge = Army.find_or_initialize_by(name: "Scourge")
scourge.name = "Scourge"
scourge.color = "purple"
scourge.save!

phr = Army.find_or_initialize_by(name: "PHR")
phr.name = "PHR"
phr.color = "blue"
phr.save!

shaltari = Army.find_or_initialize_by(name: "Shaltari")
shaltari.name = "Shaltari"
shaltari.color = "orange"
shaltari.save!

resistance = Army.find_or_initialize_by(name: "Resistance (Feral)")
resistance.name = "Resistance (Feral)"
resistance.color = "red"
resistance.save!

resistance1 = Army.find_or_initialize_by(name: "Resistance (Allied)")
resistance1.name = "Resistance (Allied)"
resistance1.color = "lightgreen"
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