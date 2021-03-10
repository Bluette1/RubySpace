# This will sort the elements of an array of integers using Bubble Sort.
# The array is traversed while comparing adjacent elements and swapping
# their positions where necessary. After each traversal we decrement the
# position of the last index.

def bubble_sort_concept_one(array)
  n = array.length

  while n.positive?

    j = 0

    (1..n - 1).each do |k|
      if array[j] > array[k] # Swap these two values
        store = array[j]
        array[j] = array[k]
        array[k] = store
      end
      j += 1
    end
    n -= 1; # last element is now sorted
  end

  array
end

print bubble_sort_concept_one([4, 3, 78, 2, 0, 2]), "\n"

#     This will sort the elements of an array of integers using Bubble Sort.
#     The array is traversed while comparing adjacent elements and swapping
#     their positions where necessary. In this method we repeat the procedure
#     until there are no more swaps
def bubble_sort_concept_two(array)
  no_swaps = false # initiate flag to indicate when there are no more swaps being done

  until no_swaps
    no_swaps = true
    (0..array.length - 2).each do |i|
      # check if these two elements are out of order
      next unless array[i] > array[i + 1]

      # do a swap
      store = array[i]
      array[i] = array[i + 1]
      array[i + 1] = store
      no_swaps = false
    end
  end

  array
end

print bubble_sort_concept_two([4, 3, 78, 2, 0, 2]), "\n"
