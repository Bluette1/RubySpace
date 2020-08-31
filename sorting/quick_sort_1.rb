# QuickSort1

# The first step of Quicksort is to partition an array into two parts.

# Challenge
# Given an array 'array' and a number 'p' in the first cell in the array,
# can you partition the array so that all elements greater than 'p' are to the
# right of it and all the numbers smaller than 'p' are to its left?
# For example, if given the following as input:

# 4 5 3 9 1

# The first number 4 is the pivot, so you should put the smaller
#  numbers to the left, and the larger to the right, and output:

# 3 1 4 5 9

# The array should otherwise remain in the same order.

# Can you write code to partition an array?

# Example
# p partition([4, 5, 3, 9, 1])
# => [3, 1, 4, 5, 9]
def partition(array)
  n = array.length
  idx = 0
  pivot = array[idx]
  (1..n - 1).each do |j|
    next unless array[j] < pivot

    # store the value to shift to the left of pivot
    store = array[j]

    # move everything from pivot upwards one position
    k = j - 1
    while k >= idx
      array[k + 1] = array[k]
      k -= 1
    end

    # move the [stored] value to the prev position of the pivot
    array[idx] = store
    # adjust the position of the pivot
    idx += 1
  end
  array
end

p partition([4, 5, 3, 9, 1])
# => [3, 1, 4, 5, 9]

# array_of_twenty_positions
p partition([45, 25, 46, 48, 28, 6, 13, 5, 36, 44, 7, 4, 11, 30, 24, 34, 15, 31, 38, 49])
# More info

# expected: [25, 28, 6, 13, 5, 36, 44, 7, 4, 11, 30, 24, 34, 15, 31, 38, 45, 46, 48, 49]
#      got: [25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 38, 45, 46, 48, 49]
