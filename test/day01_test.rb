require 'test/unit'

require_relative '../day01'

class Day01Test < Test::Unit::TestCase

  REAL_INPUT = File.open('input/day01.txt').read

  def test_from_q_1
    walker = Walker.new 'R2, L3'
    assert_equal(5, walker.distance)
  end

  def test_from_q_2
    walker = Walker.new 'R2, R2, R2'
    assert_equal(2, walker.distance)
  end

  def test_from_q_3
    walker = Walker.new 'R5, L5, R5, R3'
    assert_equal(12, walker.distance)
  end

  def test_part_1
    walker = Walker.new REAL_INPUT
    assert_equal(209, walker.distance)
  end

  def test_from_q_part_2
    walker = Walker.new'R8, R4, R4, R8'
    assert_equal(4, walker.real_distance)
  end

  def test_part_2
    walker = Walker.new REAL_INPUT
    puts "answer: #{walker.real_distance}"
  end

end