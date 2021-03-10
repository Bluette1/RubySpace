# Quick-Sort Advanced 2

# Guideline
# In-place quicksort algorithm that uses shifting instead of swapping.
# Swapping two elements is of course more efficient than shifting multiple elements

# The method
# If an element is smaller than the Pivot, you should shift the larger elements
# upwards one position swap it with a (larger)
# to create the insert position for this smaller element.
# Just like in the other quicksort, larger elements can just remain
#  where they are, and the pivot can then be inserted in the middle at the end
#  of the partition method.

# Challenge
# Create an in-place QuickSort and print the entire array on a new
#  line at the end of every partitioning method

# Example
# advanced_quicksort([1, 3, 9, 8, 2, 7, 5])
# # => 1 3 2 5 9 7 8
# #    1 2 3 5 9 7 8
# #    1 2 3 5 7 8 9

# Get stuck and need some hint?
# Check this link: https://gitlab.com/microverse/guides/coding_challenges/hints/blob/master/challenges/sorting-algorithms/quick-sort-advanced.md
def advanced_quicksort(array)
  quick_sort(array, 0, array.length - 1)
end

def quick_sort(array, start, ending)
  puts array.join(' ')
  return array if start > ending

  idx = partition(array, start, ending)

  # sort left side
  quick_sort(array, start, idx - 1)

  # sort right side
  quick_sort(array, idx + 1, ending)
end

def partition(array, start, ending)
  idx = start
  pivot = array[idx]
  (start + 1..ending).each do |j|
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
  idx
end
