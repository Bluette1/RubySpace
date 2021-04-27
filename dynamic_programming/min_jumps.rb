# The Problem: Given an array of non-negative integers, start_idx
# from the first element and reach the last by jumping. The jump
# length can be at most the value at the current position in the array.
# The optimum result is when you reach the goal using a minimum number
# of jumps.
# First natural/bruteforce solution: minimum_jumps(start_idx, end_idx) = MIN(minimum_jumps(i, end_idx)
# for all i that are reachable from start_idx).

def minimum_jumps(start_idx, end_idx, arr)
  return 0 if start_idx == end_idx

  min_jumps = Float::INFINITY
  return min_jumps if arr[start_idx].zero?

  # Calculate the minimum jumps for all positions i,
  # that are reachable from the start_idx, and in turn calculate
  # the minimum of the minimum_jumps for each of those indices.

  (start_idx + 1..end_idx).each do |idx|
    if idx <= start_idx + arr[start_idx]
      jumps = minimum_jumps(idx, end_idx, arr)
      min_jumps = (jumps + 1) if (jumps + 1) < min_jumps
    end
  end
  min_jumps
end

# p minimum_jumps(0, 4, [2, 3, 1, 1, 4]);
p minimum_jumps(0, 9, [2, 3, 1, 1, 2, 4, 2, 0, 1, 1])
