# Coding challenge:
# Given an array of positive integers. Get the maximum of an array,
# and that will be the maximum number of steps you can move left
# or right(i.e the length of your jump).Then get the value of the index
# and get the next landing. If that leads to the max posn, return the
# number of jumps.

# RightMove:
#  - Formular for calculating the next landing index, given the current index = (currIdx + n) % array.length
# LeftMove:
# - Invert the indexing from 0 - length - 1 so as to start from the last
#  position (length - 1) as 0. Apply the same formula

# Does this problem ring of dynamic programming? Yes, I think

# The first solution contains the minimum number of steps.
# If all possible paths are exhausted return infinity i.e impossible;

# But how do we know we have exhausted all the possibilities?
# If revisit the same node in a given path; we discard that path

# There is a tree structure embedded in this strategy, therefore think recursion.
def right_move(curr_idx, arr)
  n_jumps = arr[curr_idx]
  (curr_idx + n_jumps) % arr.length
end

def left_move(curr_idx, arr)
  n_jumps = arr[curr_idx]
  curr_idx = (arr.length - 1) - curr_idx
  (curr_idx + n_jumps) % arr.length
end

def long_jumps(arr)
  max = arr.max
  max_idx = arr.index(max)
  curr_idx_left = left_move(max_idx, arr)
  curr_idx_right = right_move(max_idx, arr)
  jumps = 1

  return jumps if max_idx == curr_idx_left || max_idx == curr_idx_right

  return jumps + 1 if max_idx <= curr_idx_left + arr[curr_idx_left] || max_idx <= curr_idx_right + arr[curr_idx_right]

  # repeatively move left or right

  result_left = find_jumps(max_idx, curr_idx_right, arr, jumps + 1, [curr_idx_right, curr_idx_left])
  result_right = find_jumps(max_idx, curr_idx_left, arr, jumps + 1, [curr_idx_right, curr_idx_left])
  [result_left, result_right].min
end

# rubocop:disable Metrics/CyclomaticComplexity
def find_jumps(max_idx, _curr_idx, arr, jumps, track_arr)
  curr_idx_left = left_move(steps, arr)
  curr_idx_right = right_move(steps, arr)
  return jumps if max_idx == curr_idx_left || max_idx == curr_idx_right

  return jumps + 1 if max_idx <= curr_idx_left + arr[curr_idx_left] || max_idx <= curr_idx_right + arr[curr_idx_right]

  result_right = Float::INFINITY
  result_left = Float::INFINITY

  unless track_arr.include?(curr_idx_right)
    track_arr << curr_idx_right
    result_right = find_jumps(max_idx, curr_idx_right, arr, jumps + 1, track_arr)
  end

  unless track_arr.include?(curr_idx_left)
    track_arr << curr_idx_left
    result_left = find_jumps(max_idx, curr_idx_left, arr, jumps + 1, track_arr)
  end

  [result_left, result_right].min
end
# rubocop:enable Metrics/CyclomaticComplexity
p long_jumps([1, 7, 1, 1, 1, 1])
# p long_jumps([2, 3, 5, 6])
