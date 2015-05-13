class Result < ActiveRecord::Base
  extend Enumerize

  belongs_to :user, required: true
  belongs_to :game, required: true

  validates_presence_of :position, :point, :score, :ranking

  enumerize :position, in: %i(east south west north)
end
