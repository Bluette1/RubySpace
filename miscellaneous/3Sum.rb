
def dynamic_two_sum(nums, target)
  sum_hash = {}
  ans = []
  (0..nums.length - 1).each do |idx|
    if sum_hash[target - nums[idx]]
      # We've found the corresponding addend
      ans << [sum_hash[target - nums[idx]], idx]
      # break
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
    p 'target', target
    tuples = dynamic_two_sum(nums, target)
    p 'tuples ', tuples
    tuples.each do |tuple|
      tuple << nums[idx]
      result << tuple
    end
  end
  result
end

# Example 1:

# Input: nums = [-1,0,1,2,-1,-4]
# Output: [[-1,-1,2],[-1,0,1]]

nums = [-1,0,1,2,-1,-4]
# nums = []
# nums = [0]

# nums = [0,0,0,0]
# nums = [3,0,-2,-1,1,2]
p three_sum(nums)