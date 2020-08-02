# Is it a Search Tree?
# Given a binary tree, can you determine if it is a proper Binary Search Tree?

# In a binary search tree, every descendant to the right of node P must be greater than P,
#  and every descendant to the left of P must be less than P.

# The input will be given as a list, as in the previous exercises.

# Here's a good Binary Search Tree:

# ...and here's a bad one:

# This tree is not a proper BST for 2 reasons:
# - The 8 is smaller than the 9, even though it is in a right subtree of 9.
# - The 6 is smaller than the 7, even though it is in a right subtree of 7.

# Challenge
# Return true if the given tree is a proper binary search tree, and false otherwise.

# Example
# tree = [10, 4, 12]

# search_tree?(tree)
# # => true

# Get stuck and need some hint?
# Check this link:
# https://gitlab.com/microverse/guides/coding_challenges/hints/blob/master/challenges/tress_and_graphs/is-it-a-search-tree.md
class Node
  attr_reader :data
  attr_accessor :left, :right

  def initialize(data)
    @data = data
  end
end

def array_to_tree(array, index = 0)
  return nil if index >= array.length || (array[index]).zero?

  node = Node.new(array[index])
  node.left = array_to_tree(array, 2 * index + 1)
  node.right = array_to_tree(array, 2 * index + 2)
  node
end

def search_tree?(array)
  root = array_to_tree(array)
  return pre_order(root).sort == in_order(root) # or `in_order(root).sort == in_order(root)` 
end

def pre_order(node, result = [])
  return result if node.nil?

  result << node.data
  pre_order(node.left, result)
  pre_order(node.right, result)
end

def print_in_order (node)
  return '' if node.nil?
  result = in_order(node.left)
  result += "#{node.data} " 
  result + in_order(node.right)
end

def in_order (node, result = [])
  return result if node.nil?
  in_order(node.left, result)
  result << node.data
  in_order(node.right, result)
end

puts search_tree?([10, 4, 12])
# => true

puts search_tree?([10, 5, 7])
# => false
