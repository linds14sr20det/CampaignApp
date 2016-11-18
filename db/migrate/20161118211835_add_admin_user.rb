class AddAdminUser < ActiveRecord::Migration[5.0]
  class User <ActiveRecord::Base; end
  def self.up
    u = User.create!(name:  "Stephen Lind",
                     email: "stephen.r.lind@gmail.com",
                     password_digest: "$2a$10$PqFahHZF9YMvu4J5mMMnE.z0g9rYUsJ4dwRcF4dhyO7NpOXuOmS/O",
                     admin: true,
                     activated: true,
                     activated_at: Time.zone.now)
    u.save
  end
end
