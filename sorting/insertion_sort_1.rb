# Insertion Sort 1

# Goal: Before sorting entire lists, sort one element in a list.

# Challenge
# Given a sorted list of numbers with an unsorted number 'X' in the right-most spot,
# can you write some simple code to insert 'X' into the list so it remains sorted?

# Print the list every time a value is shifted, until the list is fully sorted.
# The goal of this challenge is to follow the correct order of insertion sort.

# How to Solve: You can copy the right-most value ('X') to a variable, and consider its cell
# 'empty'. Since this leaves an extra cell empty on the right, you can shift every number over
# until 'X' can be inserted. This will create a duplicate of each value,
# but when you reach the right spot, you can replace a value with 'X'.

# Output Format
# On each line, output the entire array every time an item is shifted in it.
#  This will include duplicate values.

# Example
# insertion_sort([1, 3, 2])
# # => 1 3 3
# #    1 2 3

# HINT: To print the array in the format above you can use:
# puts array.join(' ')
def insertion_sort(array)
  # store the right-most number in a variable
  unsorted = array[-1]
  # start the shifting of sorted numbers starting with the second-last
  n = array.length

  (1..n).each do |idx|
    # while the number in the current position is greater than the unsorted,
    # shift forwards
    num = array[-1 * (idx + 1)]
    if num.nil?
      # first posn, insert here
      array[-idx] = unsorted
      puts array.join(' ')
      break

    elsif num > unsorted
      array[-idx] = num
      puts array.join(' ')

    else
      # insert the unsorted number here
      array[-idx] = unsorted
      puts array.join(' ')
      break
    end
  end
  array
end

p insertion_sort([1, 3, 2])
# => 1 3 3
#    1 2 3

puts '-' * 20

p insertion_sort([1, 4, 6, 9, 3])
# => 1 4 6 9 9
#    1 4 6 6 9
#    1 4 4 6 9
#    1 3 4 6 9

puts '-' * 20

p insertion_sort([2, 3, 4, 5, 6, 7, 8, 9, 10, 1])
# => 2 3 4 5 6 7 8 9 10 10
#    2 3 4 5 6 7 8 9 9 10
#    2 3 4 5 6 7 8 8 9 10
#    2 3 4 5 6 7 7 8 9 10
#    2 3 4 5 6 6 7 8 9 10
#    2 3 4 4 5 6 7 8 9 10
#    2 3 3 4 5 6 7 8 9 10
#    2 2 3 4 5 6 7 8 9 10
#    1 2 3 4 5 6 7 8 9 10
