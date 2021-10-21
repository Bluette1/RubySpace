class ListNode
  attr_accessor :value, :next_node

  def initialize(value, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

module LinkedList
  # setup head and tail
  @head = nil
  @tail = nil

  def add(number)
    new_node = ListNode.new(number)
    if @head.nil?
      @head = new_node
    else
      # insert the node at the end of the list / tail
      @tail.next_node = new_node
    end
    @tail = new_node
  end

  def get(index)
    next_node = @head
    idx = 0
    while idx < index
      next_node = next_node.next_node
      idx += 1
    end

    next_node.value
  end

  def print_all
    next_node = @head
    idx = 0
    until next_node.nil?
      p "#{idx}: #{next_node.value}"
      next_node = next_node.next_node
      idx += 1
    end
  end

  def add_at(index, item)
    new_node = ListNode.new(item)

    # Either we are adding at the front, in the middle, or at the back of the list

    if index.zero?
      # Add the new node to the front of the list
      new_node.next_node = @head
      @head = new_node
    else
      next_node = @head
      idx = 0

      # Traverse until the node just before the insert index
      while idx < index - 1
        next_node = next_node.next_node
        idx += 1
      end

      # idx = index - 1
      # insert the new node after this position

      # Check if the next node is nil, meaning we're inserting at the end of the list
      if next_node.next_node.nil?
        # insert the node at the end of the list / tail
        next_node.next_node = new_node
        @tail = new_node
      else
        new_node.next_node = next_node.next_node
        next_node.next_node = new_node
      end
    end
  end

  def empty?
    @head.nil?
  end

  def remove(index)
    # Either we are removing from the front, in the middle, or at the back of the list

    if index.zero?
      # Remove the node from the front of the list
      new_head = @head.next_node
      @head.next_node = nil
      @head = new_head
    else
      next_node = @head
      idx = 0

      # Traverse until the node just before the delete index
      while idx < index - 1
        next_node = next_node.next_node
        idx += 1
      end

      # idx = index - 1
      # delete the node after this position

      # Check if the next node is nil, meaning we're deleting a node which does not exist
      if next_node.next_node.nil?
        puts "Can't delete an inexistent node"

      # Check if the next node is the last node, meaning we're deleting at the end of the list
      elsif next_node.next_node.next_node.nil?
        next_node.next_node = nil
        @tail = next_node
      else
        next_node.next_node = next_node.next_node.next_node
      end
    end
  end
end

class Stack
  include LinkedList

  def push(number)
    # We push items onto the stack at the front of the list
    add_at(0, number)
  end

  def pop
    # We pop items off the stack from the front of the list(index 0)
    item = get(0)
    remove(0)
    item
  end
end

class Node
  attr_reader :data
  attr_accessor :left, :right, :height

  def initialize(data)
    @data = data
    @height = height
  end
end

# helper function
def array_to_tree(array, index = 0)
  return nil if index >= array.length || (array[index]).zero?

  node = Node.new(array[index])
  node.left = array_to_tree(array, 2 * index + 1)
  node.right = array_to_tree(array, 2 * index + 2)
  node
end

# helper function
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
    max_height = height if height > max_height
    begin
      node = right_nodes.pop
      height = node.height
    rescue StandardError
      break
    end
  end

  max_height
end

# helper function
def balanced?(node)
  right_nodes = Stack.new
  max_height = maximum_height(node)
  height = 0
  is_balanced = true

  loop do
    height = move_left(node, right_nodes, height)
    return false if height.negative?

    difference = (max_height - height).abs
    return false unless difference < 2

    begin
      node = right_nodes.pop
      height = node.height
    rescue StandardError
      break
    end
  end
  is_balanced
end

def move_left(node, right_nodes, height)
  empty_right_node_height = nil
  until node.nil?
    height += 1
    if node.right.nil?

      empty_right_node_height = height if empty_right_node_height.nil?
    else
      node.right.height = height
      right_nodes.push(node.right)
    end
    return -1 if !empty_right_node_height.nil? && height - empty_right_node_height > 1

    node = node.left
  end
  height
end

def balanced_tree?(array)
  root = array_to_tree(array)
  balanced?(root)
end

puts balanced_tree?([1, 2, 0, 3, 4, 0, 0])
# => false
puts balanced_tree?([1, 2, 0, 3, 0, 0, 0])
# => false

puts balanced_tree?([1, 2, 3, 4, 5, 6, 7])
# => true

puts balanced_tree?([1, 2, 3, 4, 5])
# =>true

puts balanced_tree?([1, 2, 3, 4])
# =>true
