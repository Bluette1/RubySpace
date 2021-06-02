# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def two_sum(nums, target)
  res = nil

  (0..nums.length - 1).each do |idx_x|
    (idx_x + 1..nums.length - 1).each do |idx_y|
      res = [idx_x, idx_y] if nums[idx_x] + nums[idx_y] == target
    end
  end
  res
end

def dynamic_two_sum(nums, target)
  sum_hash = {}
  ans = nil
  (0..nums.length).each do |idx|
    if sum_hash[target - nums[idx]]
      # We've found the corresponding addend
      ans = [sum_hash[target - nums[idx]], idx]
      break
    else
      # Store this value in the hash
      sum_hash[nums[idx]] = idx
    end
  end
  ans
end

# Example 1:

# Input: nums = [2,7,11,15], target = 9
# Output: [0,1]
# Output: Because nums[0] + nums[1] == 9, we return [0, 1].
# p two_sum([2,7,11,15], 9)
# p dynamic_two_sum([2,7,11,15], 9)

# Example 2:

# Input: nums = [3,2,4], target = 6
# Output: [1,2]
# Example 3:
# p two_sum([3,2,4], 6)
# p dynamic_two_sum([3,2,4], 6)
# p dynamic_two_sum([3,2,4], 4)

# Input: nums = [3,3], target = 6
# Output: [0,1]
# p two_sum([3, 3], 6)
# p dynamic_two_sum([3, 3], 6)
# p dynamic_two_sum([3, 3], 3)

p dynamic_two_sum([2, 5, 5, 11], 10)
