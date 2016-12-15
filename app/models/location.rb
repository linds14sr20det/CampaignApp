class Location < ApplicationRecord
  has_many :games, dependent: :destroy
  attr_accessor :controlling_army
end
