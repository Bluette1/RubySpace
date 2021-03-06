# Challenge
# In this challenge you need to print the data that accompanies each integer
# in a list. In addition, if two strings have the same integers,
# you need to print the strings in their original order.
# This means your sorting algorithm will need to be stable, i.e. that
#  the original order is maintained for equal elements.

# Details

# You will be given a list that contains both integers and strings.
# Can you print the strings in order of their accompanying integers?
# If the integers for two strings are equal, make sure to print them in
# the order they appeared in the original list.

# Input Format

# array, each position containing an integer x, and a string, s.

# Output Format

# Return an Array with the strings in their correct order.

# Challenge

# Print the characters according to the order of their accompanying integers.

# Example
# p full_merge_sort(["0 ab", "6 cd", "0 ef", "6 gh", "4 ij", "0 ab", "6 cd",
# "0 ef", "6 gh", "0 ij", "4 that", "3 be", "0 to", "1 be", "5 question", "1 or", "2 not", "4 is", "2 to", "4 the"])
# => ["ab", "ef", "ab", "ef", "ij", "to", "be", "or", "not", "to", "be",
#  "ij", "that", "is", "the", "question", "cd", "gh", "cd", "gh"]

def full_merge_sort(array)
  merge_sort(array, 0, array.length - 1)
  retrieve_strings array
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

def add_elements(idx, end_idx, array, source)
  # Add the remaining elements in the left sublist
  while idx <= end_idx
    array << source[idx]
    idx += 1
  end
end

def number(str)
  str.split(' ')[0].to_i
end

def string(str)
  str.split(' ')[1]
end

def retrieve_strings(array)
  (0..array.length - 1).each do |idx|
    array[idx] = string(array[idx])
  end
end

def merge(array, start_index, mid_index, end_index)
  temp = []
  i_dx = start_index
  j_dx = mid_index + 1

  while i_dx <= mid_index && j_dx <= end_index
    if number(array[i_dx]) <= number(array[j_dx])
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

p full_merge_sort(['0 ab', '6 cd', '0 ef', '6 gh', '4 ij',
                   '0 ab', '6 cd', '0 ef', '6 gh', '0 ij', '4 that', '3 be', '0 to',
                   '1 be', '5 question', '1 or', '2 not', '4 is', '2 to', '4 the'])
# => ["ab", "ef", "ab", "ef", "ij", "to", "be", "or",
#  "not", "to", "be", "ij", "that", "is", "the", "question", "cd
#  ", "gh", "cd", "gh"]
