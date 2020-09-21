# Quick Sort Running Time
# The running time of Quicksort will depend on how balanced the partitions are. If you are unlucky enough to always select the greatest or smallest element as the pivot, then each partition will only separate one element at a time, so the running time will be similar to InsertionSort.

# However, Quicksort will usually pick a pivot that is mid-range, and it will partition the array into two parts. Let's assume Partition is lucky and it always picks the median element as the pivot. What will be the running time in such a case?

# Running Time of Recursive Methods
# Quicksort is a recursive method so we will need to use a technique to
# calculate the total running time of all the method calls.
# We can use a version of the "Recursion Tree Method"
# to estimate the running time for a given array of N elements.
# In real sorting, Quicksort won't always pick the exact middle element. But as long as it's not regularly picking really poorly, it will have a similar running time. To make sure it works well on most input, real-world Quicksort implementations don't pick the same index for pivot each time, but use some other technique instead, such as picking a random element. There are other techniques used to improve Quicksort.

# Notice that n*log n is much much faster than the O(n^2) running time of Insertion Sort. For example, on an array of 1 million elements, n^2 = 10^12, while n*log n is approx. 20 million, a much more manageable number. 

# Challenge 
# How much faster is Quicksort than Insertion Sort in practice? Compare the running time of the two algorithms by counting how many swaps or shifts each one takes to sort an array, and output the difference. You can modify your previous sorting code to keep track of the swaps. 

# Output Format 
# Return a number D, where D = (insertion sort shifts) - (quicksort swaps)

# Explanation 
# Insertion Sort will take 9 "shifts" to sort the array. Quicksort will take 8 "swaps" to sort it, as shown in the diagram below. 9-8 = 1, the output.
def quicksort_running_time(array)
  insertion_sort_time(array.clone) - quicksort_time(array.clone)
end

def quicksort_time(array)
  $swaps = 0
  quick_sort(array, 0, array.length - 1)
  $swaps
end

def quick_sort(array, start, ending)
  return array if start >= ending 

  idx = partition(array, start, ending)

  # sort left side
  quick_sort(array, start, idx - 1)

  # sort right side
  quick_sort(array, idx + 1, ending)
end

def partition(array, start, ending)
  pivot = array[ending]
  smaller_end_idx = start
  j = start
  while j <= ending

    # --------------------------------------------------------------------------------
    # swap adjacents into the right positions if they are both smaller
    # ignore the larger
    # swap a smaller value with the first available value in the larger section
    # ----------------------------------------------------------------------------------
    if array[j] < pivot

      array[smaller_end_idx], array[j] = array[j], array[smaller_end_idx]
      $swaps += 1

      smaller_end_idx += 1
    end
    j += 1
  end
  # swap(array, smaller_end_idx, ending)
  array[smaller_end_idx], array[ending] = array[ending], array[smaller_end_idx]
  $swaps += 1

  smaller_end_idx
end

def insertion_sort_time(array)
  insertion_sort(array)
end

def insertion_sort(array)
  shifts = 0
  (1...array.length).each do |i|
    key = array[i]
    j = i - 1
    while j >= 0 && array[j] > key
      array[j + 1] = array[j]
      j -= 1
      shifts += 1
    end

    array[j + 1] = key
  end
  shifts
end
puts quicksort_running_time([1, 3, 9, 8, 2, 7, 5])
# => 1

