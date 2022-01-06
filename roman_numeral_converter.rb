# Create a method which converts an integer to roman numerals.
# Example: integer_to_roman(156) => 'CLVI'
def map
  {
    1 => 'I',
    5 => 'V',
    10 => 'X',
    50 => 'L',
    100 => 'C',
    500 => 'D',
    1000 => 'M'
  }
end

def find_res(res, times, divisor)
  while times.positive?
    res += map[divisor].to_s
    times -= 1
  end
  res
end

def convert_less_than_ten(value, divisor, res, posn)
  if value == 5
    res += map[5 * divisor].to_s
  elsif value == 4
    res += "#{map[divisor]}#{map[5 * divisor]}"
  elsif value == 9
    res += "#{map[divisor]}#{map[10**(posn + 1)]}"
  elsif value < 4
    times = value
    res = find_res(res, times, divisor)
  elsif value > 5
    res += map[5 * divisor].to_s
    times = value - 5
    res = find_res(res, times, divisor)
  end
  res
end

def convert_roman(num, posn, res)
  return map[num] if map[num]

  divisor = 10**posn
  value = (num / divisor).floor
  rem = num % divisor

  return res if value.zero?
  return convert_roman(num, posn + 1, res) if value >= 10

  res = convert_less_than_ten(value, divisor, res, posn)
  "#{convert_roman(num, posn + 1, res)}#{convert_roman(rem, 0, '')}"
end

def convert_to_roman(num)
  convert_roman(num, 0, '')
end

puts convert_to_roman(156); # should return the string CLVI
puts convert_to_roman(1023); # should return the string MXXIII
