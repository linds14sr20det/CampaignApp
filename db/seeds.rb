# Create Locations and Armies. These shouldn't change after initial deploy

Location.create(name: "Eastern Port")
Location.create(name: "Space Port")
Location.create(name: "Mesa Prime")
Location.create(name: "Hab Blocks")
Location.create(name: "Old City")

Army.create(name: "UCM")
Army.create(name: "Scourge")
Army.create(name: "PHR")
Army.create(name: "Shaltari")
Army.create(name: "Resistance (Allied)")
Army.create(name: "Resistance (Feral)")

# Create a bunch of test accounts

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now)
end

users = User.order(:created_at).take(6)
location = Location.first
user_army = Army.find(1)
opponent_army = Army.find(2)

50.times do
  users.each { |user| user.games.create!(win: true, location_id: location.id, user_army_id: user_army.id, opponent_army_id: opponent_army.id) }
end