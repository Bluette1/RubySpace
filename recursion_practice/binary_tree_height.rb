# Instructions from your teacher:
# How Tall is the Tree?
# Can you find the height of a Binary Tree? The height is the number of Nodes from the Root
# to the lowest Leaf. The Tree does not need to be balanced.
#
# For example, in the tree below, the height is 4:
#
# Challenge
# Return the height of the Tree.
#
# Example
#
# array_tree = [2, 7, 5, 2, 6, 0, 9]
#
# puts binary_tree_height(array_tree)
# => 3
class Node
  attr_reader :data
  attr_accessor :left, :right

  def initialize(data)
    @data = data
  end
end

def array_to_tree(array, idx)
  return nil if idx >= array.length || (array[idx]).zero?

  node = Node.new(array[idx])
  node.left = array_to_tree(array, 2 * idx + 1)
  node.right = array_to_tree(array, 2 * idx + 2)
  node
end

def max_height(node, count)
  if node.nil?
    count
  else
    1 + [max_height(node.left, 0), max_height(node.right, 0)].max
  end
end

def binary_tree_height(array_tree)
  tree = array_to_tree(array_tree, 0)
  max_height(tree, 0)
end

puts binary_tree_height([2, 7, 5, 2, 6, 0, 9])
