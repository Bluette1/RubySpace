# More Practice

# Hash and Sets are useful in a wide variety of challenges. Below is another practice challenge.

# Challenge
# Given a list of numbers, can you find all the pairs of numbers whose sum equals k?

# Input

# The provided function takes 2 parameters: an array array, and the special number k.

# Output

# Return an Array with the pairs of numbers. Print each pair with the
# first number followed by the second, and print all the pairs in the order that
# the second number appears in the list.

# Sample Input/Output
# Example
# p find_pairs([1, 9, 11, 13, 2, 3, 7], 12)
# # => [[1, 11], [9, 3]]

# 12 is the special number. There are 2 pairs with that sum: 1 & 11 and 9 & 3.
# 11 appears before 3 in the input, so that pair is printed first.

# Full Credit
# Solve the problem with only one iteration through the numbers.

require 'set'

def find_pairs(array, sum)
  hash_map = {}
  result = []

  array.each do |item|
    hash_map[item] = array.reject do |element|
      element == item || (element + item) != sum
    end
    array.reject! do |element|
      hash_map[item].include?(element)
    end
    result << [item, hash_map[item][0]] unless hash_map[item].empty?
  end
  result
end

def find_pairs_other(array, sum)
  hash_map = {}
  result = []
  pairs = Set.new

  array.each do |item|
    hash_map[item] = array.reject do |element|
      element == item || (element + item) != sum
    end
    next if hash_map[item].empty?

    pair = [item, hash_map[item][0]]
    result << pair unless pairs.include?(item) || pairs.include?(hash_map[item][0])
    pairs << item << hash_map[item]
  end

  result
end

def find_pairs_other_other(array, sum)
  hash_map = {}
  result = []

  array.each do |item|
    hash_map[item] = array.select do |element|
      (element + item) == sum
    end
    unless hash_map[item].empty?
      array.delete(hash_map[item][0])
      result << [item, hash_map[item][0]]
    end
  end
  result
end
p find_pairs([1, 9, 11, 13, 2, 3, 7], 12)
p find_pairs_other([1, 9, 11, 13, 2, 3, 7], 12)
p find_pairs_other_other([1, 9, 11, 13, 2, 3, 7], 12)
# => [[1, 11], [9, 3]]
