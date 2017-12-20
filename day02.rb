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