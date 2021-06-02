def check_valid(tupple, nums)
  valid = true
    (0..tupple.length - 1).each do |posn|
      valid = false if nums.count(tupple[posn]) < tupple.count(tupple[posn])
    end
  valid
end

def dynamic_two_sum(nums, target)
  sum_hash = {}
  result = []
  (0..nums.length - 1).each do |idx|
    if sum_hash[target - nums[idx]]
      result << [nums[sum_hash[target - nums[idx]]], nums[idx]]
    else
      sum_hash[nums[idx]] = idx
    end
  end
  result
end

def three_sum(nums)
  result = []
  nums.sort!
  (0..nums.length - 1).each do |idx|
    next if nums[idx] == nums[idx - 1]
    target = -1 * nums[idx]
    tupples = dynamic_two_sum(nums, target)
    tupples.each do |tupple|
      tupple << nums[idx]
      tupple.sort!
      result << tupple if check_valid(tupple, nums) && !result.include?(tupple)
    end
  end
  result.sort
end

# Example 1:

# Input: nums = [-1,0,1,2,-1,-4]
# Output: [[-1,-1,2],[-1,0,1]]

# nums = [-1, 0, 1, 2, -1, -4]
# nums = []
# nums = [0]

# nums = [0,0,0,0]
nums = [3,0,-2,-1,1,2]
p three_sum(nums)
