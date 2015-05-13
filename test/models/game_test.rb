require 'test_helper'

class GameTest < ActiveSupport::TestCase
  setup do
    @user = User.new
  end

  test 'should save with just 4 results' do
    game = Game.new
    game.results << Result.new(user: @user, position: :east,  point: 35000, score:  45, ranking: 1)
    game.results << Result.new(user: @user, position: :south, point: 26000, score:   6, ranking: 2)
    game.results << Result.new(user: @user, position: :west,  point: 24000, score: -16, ranking: 3)
    game.results << Result.new(user: @user, position: :north, point: 15000, score: -35, ranking: 4)
    assert game.save, '4 results given'
  end

  test 'should not save without a result' do
    game = Game.new
    assert_not game.save, 'no results given'
  end

  test 'should not save with 3 results' do
    game = Game.new
    game.results << Result.new(user: @user, position: :east,  point: 35000, score:  45, ranking: 1)
    game.results << Result.new(user: @user, position: :south, point: 26000, score:   6, ranking: 2)
    game.results << Result.new(user: @user, position: :west,  point: 24000, score: -16, ranking: 3)
    assert_not game.save, '3 results given'
  end

  test 'should not save with 5 results' do
    game = Game.new
    game.results << Result.new(user: @user, position: :east,  point: 35000, score:  45, ranking: 1)
    game.results << Result.new(user: @user, position: :south, point: 26000, score:   6, ranking: 2)
    game.results << Result.new(user: @user, position: :west,  point: 24000, score: -16, ranking: 3)
    game.results << Result.new(user: @user, position: :north, point: 15000, score: -35, ranking: 4)
    game.results << Result.new(user: @user, position: :north, point: 15000, score: -35, ranking: 4)
    assert_not game.save, '5 results given'
  end

  test 'should save with total 100000 points' do
    game = Game.new
    game.results << Result.new(user: @user, position: :east,  point: 35000, score:  45, ranking: 1)
    game.results << Result.new(user: @user, position: :south, point: 26000, score:   6, ranking: 2)
    game.results << Result.new(user: @user, position: :west,  point: 24000, score: -16, ranking: 3)
    game.results << Result.new(user: @user, position: :north, point: 15000, score: -35, ranking: 4)
    assert game.save, '100000 points'
  end

  test 'should not save with total 99900 points' do
    game = Game.new
    game.results << Result.new(user: @user, position: :east,  point: 35000, score:  45, ranking: 1)
    game.results << Result.new(user: @user, position: :south, point: 26000, score:   6, ranking: 2)
    game.results << Result.new(user: @user, position: :west,  point: 24000, score: -16, ranking: 3)
    game.results << Result.new(user: @user, position: :north, point: 14900, score: -35, ranking: 4)
    assert_not game.save, '99900 points'
  end

  test 'should not save with total 10100 points' do
    game = Game.new
    game.results << Result.new(user: @user, position: :east,  point: 35000, score:  45, ranking: 1)
    game.results << Result.new(user: @user, position: :south, point: 26100, score:   6, ranking: 2)
    game.results << Result.new(user: @user, position: :west,  point: 24000, score: -16, ranking: 3)
    game.results << Result.new(user: @user, position: :north, point: 15000, score: -35, ranking: 4)
    assert_not game.save, '99900 points'
  end
end
