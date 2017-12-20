require 'test/unit'

require_relative '../day02'

class Day02Test < Test::Unit::TestCase

  REAL_INPUT = File.open('input/day02.txt').read

  def test_from_q
    result = input_to_numberstring 'ULL
RRDDD
LURDL
UUUUD
'
    assert_equal('1985', result)
  end

  def test_part_1
    puts "answer 1: #{input_to_numberstring REAL_INPUT}"
  end

  def test_from_q_part_2
    result = input_to_numberstring_2 'ULL
RRDDD
LURDL
UUUUD
'
    assert_equal('5DB3', result)
  end

  def test_part_2
    puts "answer 2: #{input_to_numberstring_2 REAL_INPUT}"
  end

end