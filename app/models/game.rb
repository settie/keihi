class Game < ActiveRecord::Base
  extend Enumerize

  enumerize :length_type, in: %i(half east)

  validates :length_type, presence: true
end
