require_relative '../../LinkedLists/stack'
# tructions from your teacher:
# Stacks or Recursion
# While certain coding problems can be solved most effectively with recursion,
# you can also learn how to do them without it!
#
# Trees, Recursion & Stacks
#
# Trees are recursive structures, so most tree algorithms use recursion to 'branch out'
# through the tree.
# Q: How does the compiler keep track of all these recursive calls?
# A: Each function call is placed on a Stack, and is popped off the stack as the results
# are returned.
# Q: Could I use my own Stack to track results instead of using recursion?
# A: Yes, you can always replace recursion with a Loop and a  Stack. It will usually make
# your code much messier, but there are rare  occasions when you'll want to do it.
#
# Challenge
#
# Find How Tall is the Tree? by using a Stack and a Loop.
#
# Details
#
# The height of a Tree is the number of Nodes from the Root to the lowest Leaf.
# The Tree does not need to be balanced.
# For example, in the tree below, the height is 4:
#
# You will be given a Tree stored in a list. Find and print the height of the Tree.
#
# Examples
#
# The following are 3 test cases:
#
# puts tree_height([2, 7, 5, 2, 6, 0, 9])
# => 3
#
# puts tree_height([1, 7, 5, 2, 6, 0, 9, 3, 7, 5, 11, 0, 0, 4, 0])
# => 4
#
# puts tree_height([5, 3, 2, 9, 0, 0, 7, 0, 0, 0, 0, 0, 0, 5, 0])
# => 4
class Node
  attr_reader :data
  attr_accessor :left, :right, :height

  def initialize(data, height = nil)
    @data = data
    @height = height
  end
end
def array_to_tree(array, idx)
  return nil if idx >= array.length || (array[idx]).zero?

  node = Node.new(array[idx])
  node.left = array_to_tree(array, 2 * idx + 1)
  node.right = array_to_tree(array, 2 * idx + 2)
  node
end

def maximum_height(node)
  right_nodes = Stack.new
  max_height = 0
  height = 0

  # Take the left route until we reach a leaf
  # At each level increase height by one
  # Store the right routes encountered on a stack with their heights
  # Compare the height with the current maximum height, and update it if necessary
  # Pop a node off the stack and repeat the process

  # .............................................................................................

  loop do
    height = move_left(node, right_nodes, height)
    begin
      max_height = height if height > max_height
      node = right_nodes.pop
      height = node.height
    rescue StandardError
      break
    end
  end
  max_height
end

def move_left(node, right_nodes, height)
  until node.nil?
    height += 1
    unless node.right.nil?
      node.right.height = height
      right_nodes.push(node.right)
    end
    node = node.left
  end
  height
end

def tree_height(tree_as_list)
  tree = array_to_tree(tree_as_list, 0)
  maximum_height(tree)
end

puts tree_height([2, 7, 5, 2, 6, 0, 9])
# => 3

puts tree_height([1, 7, 5, 2, 6, 0, 9, 3, 7, 5, 11, 0, 0, 4, 0])
# => 4

puts tree_height([5, 3, 2, 9, 0, 0, 7, 0, 0, 0, 0, 0, 0, 5, 0])
# => 4
