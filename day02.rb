def input_to_numberstring(input)
  numbers = []
  current = 5
  input.lines.each do |l|
    l.split(//).each do |direction|
      case direction
        when 'U'
          current -= 3 unless current - 3 < 1
        when 'D'
          current += 3 unless current + 3 > 9
        when 'L'
          current -= 1 unless [1,4,7].include? current
        when 'R'
          current += 1 unless [3,6,9].include? current
      end
    end
    numbers << current
  end

  numbers.map{|n| n.to_s}.join
end

#     1
#   2 3 4
# 5 6 7 8 9
#   A B C
#     D
def input_to_numberstring_2(input)
  numbers = []
  current = 5

  up = [['D','B'],
        ['A',6],['B',7],['C',8],
        [6,2],[7,3],[8,4],
        [3,1]].to_h
  down = [[1,3],
           [6,'A'],[7,'B'],[8,'C'],
           [2,6],[3,7],[4,8],
           ['B','D']].to_h
  left = [[9,8],
        [4,3],[8,7],['C','B'],
        [3,2],[7,6],['B','A'],
        [6,5]].to_h
  right = [[5,6],
          [2,3],[6,7],['A','B'],
          [3,4],[7,8],['B','C'],
          [8,9]].to_h

  input.lines.each do |l|
    l.split(//).each do |direction|
      case direction
        when 'U'
          current = up[current] if up.has_key? current
        when 'D'
          current = down[current] if down.has_key? current
        when 'L'
          current = left[current] if left.has_key? current
        when 'R'
          current = right[current] if right.has_key? current
      end
    end
    numbers << current
  end

  numbers.map{|n| n.to_s}.join
end