require 'test_helper'

class GameTest < ActiveSupport::TestCase
  setup do
    @user = User.new
  end

  test 'should save with just 4 results' do
    game = Game.new
    game.results << Result.new(user: @user, position: :east,  point: 350, score:  45, ranking: 1)
    game.results << Result.new(user: @user, position: :south, point: 260, score:   6, ranking: 2)
    game.results << Result.new(user: @user, position: :west,  point: 240, score: -16, ranking: 3)
    game.results << Result.new(user: @user, position: :north, point: 150, score: -35, ranking: 4)
    assert game.save, '4 results given'
  end

  test 'should not save without a result' do
    game = Game.new
    assert_not game.save, 'no results given'
  end

  test 'should not save with 3 results' do
    game = Game.new
    game.results << Result.new(user: @user, position: :east,  point: 350, score:  45, ranking: 1)
    game.results << Result.new(user: @user, position: :south, point: 260, score:   6, ranking: 2)
    game.results << Result.new(user: @user, position: :west,  point: 240, score: -16, ranking: 3)
    assert_not game.save, '3 results given'
  end

  test 'should not save with 5 results' do
    game = Game.new
    game.results << Result.new(user: @user, position: :east,  point: 350, score:  45, ranking: 1)
    game.results << Result.new(user: @user, position: :south, point: 260, score:   6, ranking: 2)
    game.results << Result.new(user: @user, position: :west,  point: 240, score: -16, ranking: 3)
    game.results << Result.new(user: @user, position: :north, point: 150, score: -35, ranking: 4)
    game.results << Result.new(user: @user, position: :north, point: 150, score: -35, ranking: 4)
    assert_not game.save, '5 results given'
  end

  test 'should save with total 100000 points' do
    game = Game.new
    game.results << Result.new(user: @user, position: :east,  point: 350, score:  45, ranking: 1)
    game.results << Result.new(user: @user, position: :south, point: 260, score:   6, ranking: 2)
    game.results << Result.new(user: @user, position: :west,  point: 240, score: -16, ranking: 3)
    game.results << Result.new(user: @user, position: :north, point: 150, score: -35, ranking: 4)
    assert game.save, '100000 points'
  end

  test 'should not save with total 99900 points' do
    game = Game.new
    game.results << Result.new(user: @user, position: :east,  point: 350, score:  45, ranking: 1)
    game.results << Result.new(user: @user, position: :south, point: 260, score:   6, ranking: 2)
    game.results << Result.new(user: @user, position: :west,  point: 240, score: -16, ranking: 3)
    game.results << Result.new(user: @user, position: :north, point: 149, score: -35, ranking: 4)
    assert_not game.save, '99900 points'
  end

  test 'should not save with total 10100 points' do
    game = Game.new
    game.results << Result.new(user: @user, position: :east,  point: 350, score:  45, ranking: 1)
    game.results << Result.new(user: @user, position: :south, point: 261, score:   6, ranking: 2)
    game.results << Result.new(user: @user, position: :west,  point: 240, score: -16, ranking: 3)
    game.results << Result.new(user: @user, position: :north, point: 150, score: -35, ranking: 4)
    assert_not game.save, '99900 points'
  end

  test 'should set scores and rankings' do
    game = Game.new
    game.results << first_result  = Result.new(user: @user, position: :east,  point: 350)
    game.results << second_result = Result.new(user: @user, position: :south, point: 260)
    game.results << third_result  = Result.new(user: @user, position: :west,  point: 240)
    game.results << fourth_result = Result.new(user: @user, position: :north, point: 150)

    game.save

    assert first_result.score   == 45, 'first score is 45'
    assert first_result.ranking == 1,  'first ranking is 1'

    assert second_result.score   == 6, 'second score is 6'
    assert second_result.ranking == 2, 'second ranking is 2'

    assert third_result.score   == -16, 'third score is -16'
    assert third_result.ranking == 3,   'third ranking is 3'

    assert fourth_result.score   == -35, 'fourth score is -35'
    assert fourth_result.ranking == 4,   'fourth ranking is 4'
  end

  test 'should set scores and rankings 2' do # XXX 名前の雑さよ...
    game = Game.new
    game.results << first_result  = Result.new(user: @user, position: :east,  point: 363)
    game.results << second_result = Result.new(user: @user, position: :south, point: 254)
    game.results << third_result  = Result.new(user: @user, position: :west,  point: 235)
    game.results << fourth_result = Result.new(user: @user, position: :north, point: 148)

    game.save

    assert first_result.score   == 46, 'first score is 46'
    assert first_result.ranking == 1,  'first ranking is 1'

    assert second_result.score   == 5, 'second score is 6'
    assert second_result.ranking == 2, 'second ranking is 2'

    assert third_result.score   == -16, 'third score is -16'
    assert third_result.ranking == 3,   'third ranking is 3'

    assert fourth_result.score   == -35, 'fourth score is -35'
    assert fourth_result.ranking == 4,   'fourth ranking is 4'
  end

  test 'should set scores and rankings 3' do # XXX 名前の雑さよ...
    game = Game.new
    game.results << first_result  = Result.new(user: @user, position: :east,  point: 346)
    game.results << second_result = Result.new(user: @user, position: :south, point: 257)
    game.results << third_result  = Result.new(user: @user, position: :west,  point: 238)
    game.results << fourth_result = Result.new(user: @user, position: :north, point: 159)

    game.save

    assert first_result.score   == 44, 'first score is 44'
    assert first_result.ranking == 1,  'first ranking is 1'

    assert second_result.score   == 6, 'second score is 6'
    assert second_result.ranking == 2, 'second ranking is 2'

    assert third_result.score   == -16, 'third score is -16'
    assert third_result.ranking == 3,   'third ranking is 3'

    assert fourth_result.score   == -34, 'fourth score is -34'
    assert fourth_result.ranking == 4,   'fourth ranking is 4'
  end

  test 'should set scores and rankings 4' do # XXX 名前の雑さよ...
    game = Game.new
    game.results << first_result  = Result.new(user: @user, position: :east,  point: 357)
    game.results << second_result = Result.new(user: @user, position: :south, point: 253)
    game.results << third_result  = Result.new(user: @user, position: :west,  point: 238)
    game.results << fourth_result = Result.new(user: @user, position: :north, point: 152)

    game.save

    assert first_result.score   == 46, 'first score is 46'
    assert first_result.ranking == 1,  'first ranking is 1'

    assert second_result.score   == 5, 'second score is 5'
    assert second_result.ranking == 2, 'second ranking is 2'

    assert third_result.score   == -16, 'third score is -16'
    assert third_result.ranking == 3,   'third ranking is 3'

    assert fourth_result.score   == -35, 'fourth score is -35'
    assert fourth_result.ranking == 4,   'fourth ranking is 4'
  end

  test 'should set scores and rankings with same points' do
    game = Game.new
    game.results << first_result  = Result.new(user: @user, position: :east,  point: 1000)
    game.results << second_result = Result.new(user: @user, position: :south, point:    0)
    game.results << third_result  = Result.new(user: @user, position: :west,  point:    0)
    game.results << fourth_result = Result.new(user: @user, position: :north, point:    0)

    game.save

    assert first_result.score   == 110, 'first score is 110'
    assert first_result.ranking == 1,  'first ranking is 1'

    assert second_result.score   == -20, 'second score is -20'
    assert second_result.ranking == 2, 'second ranking is 2'

    assert third_result.score   == -40, 'third score is -40'
    assert third_result.ranking == 3,   'third ranking is 3'

    assert fourth_result.score   == -50, 'fourth score is -50'
    assert fourth_result.ranking == 4,   'fourth ranking is 4'
  end
end
