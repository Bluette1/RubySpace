# Merge Sort I
# Like QuickSort, MergeSort runs quickly in O(n log n) time.
# While Mergesort uses more space and is not usually as fast (in practice)
# as Quicksort, Mergesort has the benefit of being stable, which means it
# keeps duplicate elements in the original order that they started with.
# This is meaningless if the values being sorted is all there is, but usually
# there's associated data with each element which sometimes needs to be
# preserved in the original order. For example, if you sort by one value of an
#  item, and then by another value, you may not want the second sort to mess up
#  the order of the first sort.

# Stable Sort Example

# Sort a deck of card so the suits are in order and each suit is
#  in number-order.

# Answer:
# 0 - Start with an unsorted deck
# 1 - Sort the entire deck by number
# 2 - Use a stable sort and sort by suit. Since the sort is stable,
# the number order is preserved. See each step below:
# Merge Method

# The main part of MergeSort involves the merge method, which merges 2
# sorted arrays to create one sorted array. This can be done in one pass
# through the arrays, by comparing the values of the two arrays before placing
#  a value in the large array.

# Challenge

# You are given two sorted arrays. Can you merge the them and return
#  one sorted array? This should be done with only one run through the array.

# Example
# p merge_sort([1, 3, 9, 11], [2, 4, 6, 8])
# # => [1, 2, 3, 4, 6, 8, 9, 11]

# Get stuck and need some hint?
# Check below link:

# https://gitlab.com/microverse/guides/coding_challenges/hints/blob/master/challenges/sorting-algorithms/merge-sort-1.md
# /*
# * This will do the merging and sorting of two subarrays.
def merge_sort(array1, array2)
  array = []
  i_dx = 0
  j_dx = 0

  while i_dx < array1.length && j_dx < array2.length
    if array1[i_dx] < array2[j_dx]
      array << array1[i_dx]
      i_dx += 1
    else
      array << array2[j_dx]
      j_dx += 1
    end
  end

  # Add the remaining elements in the left sublist
  add_elements(i_dx, array, array1)

  # Add the remaining elements in the right sublist
  add_elements(j_dx, array, array2)

  array
end

def add_elements(idx, array, source)
  # Add the remaining elements in the left sublist
  while idx < source.length
    array << source[idx]
    idx += 1
  end
end

p merge_sort([1, 3, 9, 11], [2, 4, 6, 8])
# => [1, 2, 3, 4, 6, 8, 9, 11]
