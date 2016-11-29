class Game < ApplicationRecord
  has_one :army, foreign_key: 'user_army_id'
  has_one :army, foreign_key: 'opponent_army_id'
  belongs_to :user
  belongs_to :location
  validates :user_id, presence: true
  validates :location_id, presence: true
  validates :user_army_id, presence: true
  validates :opponent_army_id, presence: true
end
