# Quick-Sort Advanced

# The previous version of Quicksort was easy to understand, but it was
#  not optimal. It required copying the numbers into other arrays, which
#  takes up more space and time. To make things faster, one can create an
#  "in-place" version of Quicksort, where the numbers are all sorted within
#  the array itself.

# Challenge

# Create an in-place version of Quicksort
def advanced_quicksort(array)
  quick_sort(array, 0, array.length - 1)
end

def quick_sort(array, start, ending)
  return array if start > ending

  idx = partition(array, start, ending)

  # sort left side
  quick_sort(array, start, idx - 1)

  # sort right side
  quick_sort(array, idx + 1, ending)
end

def partition(array, start, ending)
  idx = ending
  pivot = array[idx]

  (ending - 1).downto(start).each do |j|
    next unless array[j] > pivot

    # store the value to shift to the right of pivot
    store = array[j]

    # move everything from pivot downwards one position
    k = j
    while k < idx
      array[k] = array[k + 1]
      k += 1
    end

    array[idx] = store

    # adjust the position of the pivot
    idx -= 1
  end

  idx
end

p advanced_quicksort([1, 3, 9, 8, 2, 7, 5])
# => 1 2 3 5 7 8 9
