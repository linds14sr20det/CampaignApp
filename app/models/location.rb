class Location < ApplicationRecord
  has_many :games, dependent: :destroy
end
