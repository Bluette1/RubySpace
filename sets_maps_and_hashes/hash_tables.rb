# Challenge
# Create your own list-based hash table with n mod 11
# as the hash function for each number n. Always use the absolute value of n.
# Given a list of numbers, hash them all into the hash table.
# Return an array with the numbers in the order that they appear in the hash table.
# Sample Input

# [12, 24, 125, 5, 91, 1106, 2, 1021, 29, 3536, 10]

# Sample Output

# [12, 24, 2, 91, 125, 5, 3536, 1106, 29, 1021, 10]

# The hash table will look like this at the end:

# 0  1  2  3  4  5  6   7   8   9   10  //index
# . 12 24 91 125 5 1106 29  . 1021  10  //values
#       2       3536
def hash_table(arr)
  dict = hash(arr)
  arr_dict = []
  (0..10).each do |key|
    next unless dict[key]

    list = dict[key]
    list.each do |item|
      arr_dict << item
    end
  end
  arr_dict
end

def hash(arr)
  dict = {}
  arr.each do |item|
    key = item.abs % 11
    if dict[key].nil?
      dict[key] = [item]
    else
      dict[key] << item
    end
  end
  dict
end

p hash_table([12, 24, 125, 5, 91, 1106, 2, 1021, 29, 3536, 10])
# => [12, 24, 2, 91, 125, 5, 3536, 1106, 29, 1021, 10]

p hash_table([2, 341, 73, 8265, 234_004, 602, 7_400_000, 200_000_000])
# => [341, 234004, 2, 200000000, 7400000, 8265, 73, 602]
