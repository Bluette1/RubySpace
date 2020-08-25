# Insertion Sort Itself
# In Insertion Sort Part 1, you sorted one element in the array.
# Using the same approach repeatedly, can you sort an entire unsorted array?

# Output
# In this challenge print the array every time an element
#  is 'inserted' into the array in (what is currently) its correct place
#  (even if it doesn't move). Begin printing from the second element and on.

# Challenge
# Can you print the steps of Insertion Sort?

# Example
# sort_itself([1, 4, 3, 6, 9, 2])
# # => 1 4 3 6 9 2
# #    1 3 4 6 9 2
# #    1 3 4 6 9 2
# #    1 3 4 6 9 2
# #    1 2 3 4 6 9

# Get stuck and need some hint?
# Check below link:

# https://gitlab.com/microverse/guides/coding_challenges/hints/blob/master/
# challenges/sorting-algorithms/insertion-sort-itself.md
def sort_itself(array)
  (2..array.length).each do |len|
    insert_sort(array, len)
  end
  array
end

def insert_sort(array, len)
  # store the right-most number in a variable
  unsorted = array[len - 1]
  # start the shifting of sorted numbers starting with the second-last
  # n = array.length

  (1..len).each do |idx|
    # while the number in the current position is greater than the unsorted,
    # shift forwards
    num = array[len - idx - 1]
    if num.nil?
      # first posn, insert here
      array[len - idx] = unsorted
      puts array.join(' ')
      break
    elsif num > unsorted
      array[len - idx] = num
    else
      # insert the unsorted number here
      array[len - idx] = unsorted
      puts array.join(' ')
      break
    end
  end
  array
end

p sort_itself([1, 4, 3, 6, 9, 2])
# => 1 4 3 6 9 2
#    1 3 4 6 9 2
#    1 3 4 6 9 2
#    1 3 4 6 9 2
#    1 2 3 4 6 9

# -----------------------
#    1 4 3 6 9 2
#    1 3 4 6 9 2
#    1 3 4 6 9 2
#    1 3 4 6 9 2
#    1 2 3 4 6 9
