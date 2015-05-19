class Game < ActiveRecord::Base
  extend Enumerize

  PLAYER_COUNT = 4
  TOTAL_POINT = 100_000
  BASE_POINT = 30_000
  UMA_TOP = 20
  UMA_SECOND = 10

  has_many :results, inverse_of: :game

  validates :length_type, presence: true

  before_validation :calc_score_and_ranking

  accepts_nested_attributes_for :results

  enumerize :length_type, in: %i(half east)

  private

  # XXX この中で errors.add するのってどうなのよ...
  def calc_score_and_ranking
    unless results.length == PLAYER_COUNT
      errors.add(:base, "need #{PLAYER_COUNT} results")
      return false
    end

    unless results.map(&:point).compact.sum == TOTAL_POINT
      errors.add(:base, "need #{TOTAL_POINT} points")
      return false
    end

    # first sort key: point(DESC), second sort key: position(ASC)
    results.
      sort{|a, b| (b.point <=> a.point).nonzero? || (a.position_value <=> b.position_value)}.
      each.with_index(1) do |result, ranking|
      result.ranking = ranking

      # XXX 無駄な処理感が否めないので良い方法あったらリファクタして
      rounded_point = (result.point / 1000.0).round * 1000
      result.score = ((rounded_point - BASE_POINT) / 1000.0).round + uma_rating[ranking]
    end

    # 誤差をトップで吸収する
    top_result = results.sort_by(&:ranking).first
    top_result.score -= results.map(&:score).sum
  end

  def uma_rating
    {
      1 => UMA_TOP,
      2 => UMA_SECOND,
      3 => -UMA_SECOND,
      4 => -UMA_TOP
    }
  end
end
