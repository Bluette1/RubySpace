# Simple Quick Sort
# In the previous challenge, you wrote a 'partition' method to split
# an array into smaller and greater elements. This means you 'sorted' half
# the array with respect to the other half. Can you repeatedly use
# 'partition' to sort an entire array?

# Guideline: In Insertion sort, you simply went through each element in
# order and inserted it into a sorted sub-array. In this challenge, you
#  cannot focus on one element at a time, but instead must deal with
# whole sub-arrays. Each time you call partition, you are sorting two
# parts of the array with respect to each other.
# Notice if you called partition on two elements, that sub-array would be
#  fully sorted.

# Can you repeatedly call partition on each sub-array so that the entire array ends up sorted?

# In this challenge, print your array every time you finish your partitioning
#  method, i.e.
#  when you combine the partitioned array together. The first element in
# a sub-array should
#  be used as a pivot. Partition the left side before partitioning the right side.
#  Do not add the pivot to either side. Instead, put it in the middle when
#  combining the two lists together.

# ![image](./quick_sort.png)

# Challenge

# Can you code a Quicksort algorithm?

# Example
# p simple_quicksort([5, 8, 1, 3, 7, 10, 2])
# => 2 3
#    1 2 3
#    7 8 10
#    1 2 3 5 7 8 10
def simple_quicksort(array)
  return array if array.length <= 1

  pivot = partition(array)

  left = if pivot.zero?
           []
         else
           simple_quicksort(array[0..(pivot - 1)])
         end

  right = if pivot == array.length - 1
            []
          else
            simple_quicksort(array[(pivot + 1)..(array.length - 1)])
          end

  join(left, [array[pivot]], right)
end

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

  idx
end

def join(left, pivot, right)
  result = left.concat(pivot).concat(right)
  puts result.join(' ')
  result
end
simple_quicksort([5, 8, 1, 3, 7, 10, 2])
# => 2 3
#    1 2 3
#    7 8 10
#    1 2 3 5 7 8 10
