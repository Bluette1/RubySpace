=begin
Creating a Tree

The previous challenge showed how to store a Tree in an Array. But how do you convert a Tree from an Array to the more-standard Node form?

Implementing a Tree

To implement a Tree, we'll create a Node class. It will store an integer of Data, and point to 2 child Nodes.

class Node
  attr_reader :data
  attr_accessor :left, :right

  def initialize(data)
    @data = data
  end

end

Create a Node node from a given cell i in the array: Node node = new Node(array[i]);
Create the children Nodes from their positions in the array. (See step #1).
Assign the children Nodes to node.left and node.right.

You first create a Node, and then you create children Nodes in the  same manner. This sounds like a recursive function will be needed!

As  mentioned, since trees are recursive structures, recursive functions are  used to navigate them.

Here's the above algorithm:

def array_to_tree(array, i)
  return nil if i >= array.length || array[i] == 0

  node = Node.new(array[i])
  node.left = array_to_tree(array, 2*i+1)
  node.right = array_to_tree(array, 2*i+2)

  node
end

Traversing a Tree in Pre-order

Pre-order traversal means you process a Node and then process its sub-trees.

Here is the pre-order algorithm:

def pre_order(node)
  if node == nil
    return ''
  end

  "#{node.data} #{pre_order(node.left)} #{pre_order(node.right)}"
end

Challenge

You will be given an array as input, which represents a Tree. Process the array into a Tree of Nodes, as shown above. Then go through the tree and print it in post-order.
Print each number space-separated.

Example test case

tree = array_to_tree([10, 1, 2, 3, 4, 5, 6])

puts post_order(tree)
#=> 3 4 1 5 6 2 10
=end
class Node
  attr_reader :data
  attr_accessor :left, :right

  def initialize(data)
    @data = data
  end
end

def array_to_tree(array, i)
  return nil if i >= array.length || array[i] == 0

  node = Node.new(array[i])
  node.left = array_to_tree(array, 2 * i + 1)
  node.right = array_to_tree(array, 2 * i + 2)

  node
end

def pre_order(node)
  if node == nil
    return ''
  end

  result = "#{node.data} "
  result += pre_order(node.left)
  result += pre_order(node.right)
end

def post_order(node)
  if node == nil
    return ''
  end

  result = "#{post_order(node.left)}"
  result += post_order(node.right)
  result += "#{node.data}"
end

tree = array_to_tree([10, 1, 2, 3, 4, 5, 6], 0)
puts post_order(tree)
#=> 3 4 1 5 6 2 10
