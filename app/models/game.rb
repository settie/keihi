class Game < ActiveRecord::Base
  extend Enumerize

  validates :length_type, presence: true

  enumerize :length_type, in: %i(half east)
end
