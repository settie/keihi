class Game < ActiveRecord::Base
  extend Enumerize

  has_many :results

  validates :length_type, presence: true

  validate :need_4_results
  validate :need_100_000_points

  enumerize :length_type, in: %i(half east)

  private

  def need_4_results
    return if results.length == 4

    errors.add(:base, 'need 4 results')
  end

  def need_100_000_points
    return if results.map(&:point).sum == 100_000

    errors.add(:base, 'need 100,000 points')
  end
end
