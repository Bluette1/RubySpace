def check_valid(result, nums)
  valid = []
  (0..result.length - 1).each do |idx|
    tupple = result[idx]
    is_valid = true
    (0..tupple.length - 1).each do |posn|
      is_valid = false if nums.count(tupple[posn]) < tupple.count(tupple[posn]) || valid.include?(tupple)
    end
    valid << tupple if is_valid
  end
  valid
end

def dynamic_two_sum(nums, target)
  sum_hash = {}
  ans = []
  (0..nums.length - 1).each do |idx|
    if sum_hash[target - nums[idx]]
      # We've found the corresponding addend
      ans << [sum_hash[target - nums[idx]], idx]
    else
      # Store this value in the hash
      sum_hash[nums[idx]] = idx
    end
  end
  result = []
  ans.each do |tuple|
    result << [nums[tuple[0]], nums[tuple[1]]]
  end
  result
end

def three_sum(nums)
  result = []

  (0..nums.length - 1).each do |idx|
    target = -1 * nums[idx]
    tuples = dynamic_two_sum(nums, target)
    tuples.each do |tuple|
      tuple << nums[idx]
      tuple.sort!
      result << tuple
    end
  end
  # p 'RESULT', result
  check_valid(result, nums)
end

# Example 1:

# Input: nums = [-1,0,1,2,-1,-4]
# Output: [[-1,-1,2],[-1,0,1]]

# nums = [-1, 0, 1, 2, -1, -4]
nums = [3,0,-2,-1,1,2]
# nums = []
# nums = [0]

# nums = [0,0,0,0]
# nums = [3,0,-2,-1,1,2]
p three_sum(nums)
