# Binary Search Tree
# The Binary Search Tree is a a Binary Tree which stores keys in a sorted manner.
# Every node's key is smaller than all the key's in the node's left subtree
#  and greater than all the key's in the nodes right subtree. Here's an example:
#
# Inserting Elements in the Tree
# Insertion and Search can usually be done very quickly in a binary Tree.
# The smallest and largest elements in the tree are easy to find.
# It's simple to go from one element to the next in the tree and to through the
# entire Tree in order.
#
# Challenge
# You will be given an array of numbers as input.
# Insert the numbers (in order) one-at-a-time into a binary search tree.
# Then return a string with the tree in pre-order (You can use the pre-order
# function that you wrote in the previous lesson).
#
# binary_search_tree([8, 3, 10, 1, 6, 14, 4, 7, 13])
# => "8 3 1 6 4 7 10 14 13"
#
# Get stuck and need some hint?
# Check below link:
# https://gitlab.com/microverse/guides/cod
class Node
  attr_reader :data
  attr_accessor :left, :right

  def initialize(data)
    @data = data
  end
end

class BST
  def initialize(root = nil)
    @root = root
  end

  def insert(node)
    if @root.nil?
      @root = node
    else
      binary_insert(@root, node)
    end
  end

  def binary_insert(current, node)
    # check where to fit the node
    if node.data < current.data
      if current.left.nil? # Insert the node here
        current.left = node
      else
        binary_insert(current.left, node)
      end
    elsif current.right.nil? # Insert the node here
      current.right = node
    else
      binary_insert(current.right, node)
    end
    @root
  end

  def pre_order(node = @root)
    return '' if node.nil?

    result = "#{node.data} "
    result += pre_order(node.left)
    result + pre_order(node.right)
  end
end

def binary_search_tree(array)
  tree = BST.new
  array.each { |e| tree.insert(Node.new(e)) }
  tree.pre_order
end

puts binary_search_tree([8, 3, 10, 1, 6, 14, 4, 7, 13])
# => "8 3 1 6 4 7 10 14 13"
