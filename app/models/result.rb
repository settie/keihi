class Result < ActiveRecord::Base
  extend Enumerize

  belongs_to :user, required: true
  belongs_to :game, required: true

  validates_presence_of :position, :point, :score, :ranking

  enumerize :position, in: {east: 1, south: 2, west: 3, north: 4}
end
