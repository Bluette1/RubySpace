=begin

Challenge

You will be given a positive integer number . Fill in the method sum so that it adds up
all the positive integers up to number and returns the sum.
For example, when given 4 it should return 10 (4+3+2+1).

While there are other ways to solve this challenge, you should use recursion to
get the sum.

Examples

puts sum(4)
# => (4 + 3 + 2 + 1) = 10

puts sum(10)
# => 55

=end
def sum(number)
  if number == 1 # this is the base case
    number
  else
    number + sum(number - 1)
  end
end

puts sum(4)
puts sum(10)
