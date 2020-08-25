# Maps

# A Map is also known as a Dictionary, since it can be used to
# store items in a similar manner as a dictionary, where each word maps
# to a specific definition. These are the basic methods of a Map:
# [key] = value - Adds the key and value to the map, so they are now associated
# with each other. If this key was already in the Map, it will now point to the
# new value only.
# [key] - Returns the value that the key maps to.
# delete(key) - Removes the key-value mapping of this key from the map.
# has_key?(key) - This returns true if the key is in the map and false
# otherwise (like the contains method of Set).

# Map in Ruby
# Ruby standard library has the class Hash.
# https://ruby-doc.org/core/Hash.html

# Challenge
# Return the number in each list that appears the most times.

# Example
# array = [1, 2, 3, 1, 5]

# appears_most_times(array)
# # => 1
def appears_most_times(array)
  hash = {}
  max = 0
  key_max = array[0]
  array.each do |num|
    if hash[num].nil?
      hash[num] = 1
    else
      hash[num] += 1
    end
    if hash[num] > max
      max = hash[num]
      key_max = num
    end
  end
  key_max
end

puts appears_most_times([1, 2, 3, 1, 5])
# => 1

puts appears_most_times([23, 43, 67, 88, 42, 35, 77, 88, 99, 11])
# => 88

puts appears_most_times([
                          4376, -345, -345, 4376, -345, 84_945, 4376, -345, -26_509, 4376, 84_945,
                          84_945, -26_509, 896_341, 4376
                        ])
# => 4376
