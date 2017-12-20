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
    puts "answer: #{input_to_numberstring REAL_INPUT}"
  end

  def test_part_2
  end

end