# The Problem: Given an array of non-negative integers, startIdx 
# from the first element and reach the last by jumping. The jump 
# length can be at most the value at the current position in the array. 
# The optimum result is when you reach the goal using a minimum number 
# of jumps.
# First natural/bruteforce solution: minimum_jumps(startIdx, endIdx) = MIN(minimum_jumps(i, endIdx) for all i that are reachable from ‘startIdx’).

def minimum_jumps(startIdx, endIdx, arr)
  return 0 if arr[startIdx] == arr[endIdx]
  min_jumps = Float::INFINITY
  return min_jumps if arr[startIdx] == 0

  # Calculate the minimum jumps for all positions i,
  # that are reachable from the startIdx, and in turn calculate
  # the minimum of the minimum_jumps for each of those indices.

  (startIdx + 1..endIdx).each do |idx|
    if (idx  <= startIdx + arr[startIdx])
      jumps = minimum_jumps(idx, endIdx, arr)
      min_jumps = jumps + 1 if (jumps + 1) < min_jumps
    end
  end
  return min_jumps
end

p minimum_jumps(0, 4, [2, 3, 1, 1, 4])