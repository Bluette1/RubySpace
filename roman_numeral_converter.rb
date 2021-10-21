# Create a method which converts an integer to roman numerals.
# Example: integer_to_roman(156) => 'CLVI'
def convert_roman(num, posn, res)
  map = {
    1 => 'I',
    5 => 'V',
    10 => 'X',
    50 => 'L',
    100 => 'C',
    500 => 'D',
    1000 => 'M'
  }
  return map[num] if map[num]

  divisor = 10**posn
  value = (num / divisor).floor
  rem = num % divisor

  return res if value.zero?
  return convert_roman(num, posn + 1, res) if value >= 10

  if value == 5
    res += (map[5 * divisor]).to_s
  elsif value == 4
    res += "#{map[divisor]}#{map[5 * divisor]}"
  elsif value == 9
    const prev = map[divisor]
    const next_div = 10**(posn + 1)
    res += "#{prev}#{map[next_div]}"
  elsif value < 4
    times = value
    while times.positive?
      res += (map[divisor]).to_s
      times -= 1
    end
  elsif value > 5
    res += (map[5 * divisor]).to_s
    times = value - 5
    while times.positive?
      res += (map[divisor]).to_s
      times -= 1
    end
  end
  "#{convert_roman(num, posn + 1, res)}#{convert_roman(rem, 0, '')}"
end

def convert_to_roman(num)
  convert_roman(num, 0, '')
end

puts convert_to_roman(156); # should return the string CLVI
puts convert_to_roman(1023); # should return the string MXXIII
