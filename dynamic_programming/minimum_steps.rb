# Minimum steps to minimize n to 1
# Given n, return the minimum steps to minimize n to 1.

# Available steps are:
# Decrement n by 1
# If n is divisible by 2, then divide n by 2
# If n is divisible by 3, then divide n by 3
def min_steps(number)
  min = [0, 0]
  (2..number).each do |num|
    arr_soln = []
    arr_soln << (1 + min[num - 1])
    arr_soln << (1 + min[num / 2]) if num.even?
    arr_soln << (1 + min[num / 3]) if (num % 3).zero?
    min << arr_soln.min
  end
  min[number]
end

puts min_steps 15
puts min_steps 10
puts min_steps 9
puts min_steps 8
puts min_steps 7
puts min_steps 6
puts min_steps 1000
puts min_steps 10_000
puts min_steps 100_000
