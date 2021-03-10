# Find the Duplicates

# Sometimes you need to compare lists of number,
# but sorting each one normally will take too much time.
# Instead you can use alternative methods to find the differences between
# each list. Try to find a faster way to do this challenge than sorting two
# entire lists.

# Challenge

# Numeros The Artist was arranging two identical lists of numbers A and B
# into specific orders. While it seemed like two random arrangements to
# everyone else, Numeros was very proud of his arrangements. Unfortunately,
# some numbers got left out of List A. Can you find the missing numbers from A
# without messing up his order?

# Details

# There are many duplicates in each list, but you need to find
# the extra numbers in B that remain once all the AB "matches" have been
# found. The numbers are all within a range of 100 from each other.

# Guideline

# Don't sort the lists to solve this problem. In fact, you can solve it
# with one pass through each of the lists.

# Challenge
# Find all the 'extra' numbers that are in B but not in A, and output them
# in ascending order.

# Example
# p duplicates([203, 204, 205, 206, 207, 208, 203, 204, 205, 206],
#  [203, 204, 204, 205, 206, 207, 205, 208, 203, 206, 204, 205, 206])
# # => [204, 205, 206]

# These numbers are extra in the 2nd list. Note each list can be
#  in any order and the extra numbers can appear anywhere in the list.
def duplicates(arr1, arr2)
  count = [0] * 101
  result = []

  shift = nil
  shift = if arr1.min / 100 == arr1.max / 100
            0
          else
            arr1.min % 100
          end
  base = arr1[0] / 100

  (0..arr1.length - 1).each do |idx|
    count[((arr1[idx] - shift) % 100)] += 1
  end

  (0..arr2.length - 1).each do |idx|
    count[((arr2[idx] - shift) % 100)] -= 1
  end

  (0..count.length - 1).each do |idx|
    result << (base * 100 + idx + shift) if count[idx].negative?
  end
  result
end

p duplicates([203, 204, 205, 206, 207, 208, 203, 204, 205, 206],
             [203, 204, 204, 205, 206, 207, 205, 208, 203, 206, 204, 205, 206])
# => [204, 205, 206]

p duplicates(
  [10, 3, 17, 11, 5, 10, 3, 9, 11, 33, 41, 22, 8, 17, 3, 11, 35, 52, 73, 88],
  [
    22, 3, 10, 11, 33, 41, 11, 5, 3, 17, 10, 3, 9, 11,
    52, 73, 88, 35, 10, 11, 3, 8, 17, 8
  ]
)
# => [3, 8, 10, 11]

p duplicates(
  [3696, 3739, 3714, 3719, 3687, 3732, 3657, 3654, 3741, 3731],
  [3696, 3696, 3739, 3714, 3714, 3719, 3687, 3687, 3732, 3732, 3657, 3657, 3654, 3741, 3741, 3731]
)
# => [3657, 3687, 3696, 3714, 3732, 3741]
