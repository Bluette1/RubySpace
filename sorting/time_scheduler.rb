# Instructions from your teacher:
# Time Scheduler
# You're working on a scheduler app. The user would like to attend
# as many events as possible but cannot attend events that overlap.
# Can you find the schedule with the greatest number of non-overlapping events?

# See if you can find an O(n log n) solution.

# I/O Format
# You will be given a list of n numbers. The numbers consist of n/2 pairs,
# where each pair is the start and end time of an event.
# Find the optimal schedule of events and return an array with each time
# like this: [start, end].

# Sample Input

# [4, 8, 1, 3, 7, 9, 5, 6]

# Sample Output

# [[1,3], [5,6], [7,9]]

# Explanation

# You are given 4 events:

# [[4,8], [1,3], [7,9], [5,6]]

# [4, 8] overlaps with 2 other events, so it should be left out,
#  but the other 3 can all be included.

# Challenge
# Return an array with the schedule that fits the most events.

# Example
# p time_scheduler([4, 8, 1, 3, 7, 9, 5, 6])
# # => [[1,3], [5,6], [7,9]]

# Get stuck and need some hint?
# Check below link:

# https://gitlab.com/microverse/guides/coding_challenges/hints/blob/master/challenges/sorting-challenges/time-scheduler.md
def time_scheduler(array)
  array = tuple(array)
  full_merge_sort(array)
  remove_overlaps(array)
  array
end

def full_merge_sort(array)
  merge_sort(array, 0, array.length - 1)
  array
end

def merge_sort(array, start_index, end_index)
  return unless start_index < end_index

  mid_index = (start_index + end_index) / 2

  # Do recursive calls to divide list into sublists
  merge_sort(array, start_index, mid_index)
  merge_sort(array, mid_index + 1, end_index)

  # Sort and merge the sublists
  merge(array, start_index, mid_index, end_index)
end

def merge(array, start_index, mid_index, end_index)
  temp = []
  i_dx = start_index
  j_dx = mid_index + 1

  while i_dx <= mid_index && j_dx <= end_index
    if array[i_dx][0] < array[j_dx][0]
      temp << array[i_dx]
      i_dx += 1
    else
      temp << array[j_dx]
      j_dx += 1
    end
  end

  # Add the remaining elements in the left sublist
  add_elements(i_dx, mid_index, temp, array)

  # Add the remaining elements in the right sublist
  add_elements(j_dx, end_index, temp, array)

  # copy elements from temp into array
  (0..temp.length - 1).each do |k_dx|
    array[start_index + k_dx] = temp[k_dx]
  end
end

def add_elements(idx, end_idx, array, source)
  # Add the remaining elements in the left sublist
  while idx <= end_idx
    array << source[idx]
    idx += 1
  end
end

def tuple(array)
  tuples = []
  idx = 0
  while idx < array.length
    tuples << [array[idx], array[idx + 1]]
    idx += 2
  end
  tuples
end

def remove_overlaps(array)
  length = array.length

  idx = 0
  while idx < length - 1
    if array[idx][1] >= array[idx + 1][1]
      array.delete_at(idx)
      idx -= 1
      length -= 1
    elsif array[idx][1] >= array[idx + 1][0]
      array.delete_at(idx + 1)
      idx -= 1
      length -= 1
    end
    idx += 1
  end
end

p time_scheduler([4, 8, 1, 3, 7, 9, 5, 6])
# => [[1,3], [5,6], [7,9]]
p time_scheduler([3, 8, 1, 2, 3, 9, 1, 5, 4, 5, 8, 14])
# => [[1, 2], [4, 5], [8, 14]]
p time_scheduler([2, 6, 5, 10, 7, 12, 0, 9, 4, 8])
# => [[2, 6], [7, 12]]
p time_scheduler([0, 1, 14, 16, 4, 8, 10, 12, 7, 9, 8, 15, 3, 5])
# => [[0, 1], [3, 5], [7, 9], [10, 12], [14, 16]]
