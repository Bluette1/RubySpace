# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def two_sum(nums, target)
  res = nil
  
  (0..nums.length - 1).each do |idx_x|
    (idx_x + 1..nums.length - 1).each do |idx_y|
      if (nums[idx_x] + nums[idx_y] === target)
        res = [idx_x, idx_y]
      end
    end
  end 
  res  
end

def dynamic_two_sum(nums, target)
  sums = Array.new(target + 1) { Array.new(0) {} }

  (0..target).each do |sum|
    (0..nums.length - 1).each do |v|
      if nums[v] <= sum
        m = sums[sum - nums[v]].clone
        
        if !m.length.zero?
          sums[sum] = m
          sums[sum] << v if !m.include?(v) && m.length < 2
        else
           if nums[v] == sum && nums[sums[sum].length - 1] != nums[v] 
            sums[sum] = [v]
          else 
            n = sums[sum].clone
            s = 0
            (0..n.length - 1).each do |i_sum|
              s += nums[i_sum]
            end
            n << v if nums[v] == sum  && s < sum
            sums[sum] = n
           end

        end     
        
      end
    end
  end
  p sums
   sums[target]
end

# Example 1:

# Input: nums = [2,7,11,15], target = 9
# Output: [0,1]
# Output: Because nums[0] + nums[1] == 9, we return [0, 1].
# p two_sum([2,7,11,15], 9)
p dynamic_two_sum([2,7,11,15], 9)

# Example 2:

# Input: nums = [3,2,4], target = 6
# Output: [1,2]
# Example 3:
# p two_sum([3,2,4], 6)
p dynamic_two_sum([3,2,4], 6)
# p dynamic_two_sum([3,2,4], 4)

# Input: nums = [3,3], target = 6
# Output: [0,1]
# p two_sum([3, 3], 6)
p dynamic_two_sum([3, 3], 6)
# p dynamic_two_sum([3, 3], 3)