# DFS Algorithm
# DFS goes through a graph as far as possible in one direction before backtracking
#  to other nodes. DFS is similar to the pre-order tree traversal, but you need to
#  make sure you don't get stuck in a loop. To do this, you'll need to keep track of
#  which Nodes have been visited.

# Challenge

# Create a graph from the given input and Run through it with a Depth-first-search.
# Return an Array with the nodes in the order you first visit them. Visit the first
# adjacent Node in the input before going on to the other nodes.

# Example
# graph = {
#   0 => [2],
#   1 => [4],
#   2 => [5, 0, 3, 6],
#   3 => [2],
#   4 => [1, 5],
#   5 => [4, 2],
#   6 => [2]
# }

# depth_first_search(graph)
#  => [0, 2, 5, 4, 1, 3]
#  => [0, 2, 5, 4, 1, 3, 6]

# Explanation
# For this challenge, visit equivalent nodes in the same order as their input. For example,
# 5 comes before 3 in the output since it was before 3 in the input.

# Get stuck and need some hint?
# Check this link: https://gitlab.com/microverse/guides/coding_challenges/hints/blob/master/challenges/tress_and_graphs/depth-first-search.
def depth_first_search(graph)
  depth_first = []
  node = graph.keys[0]
  stack = []

  loop do
    loop do
      depth_first << node unless depth_first.include?(node)
      start = -1
      (0..graph[node].length - 1).each do |i|
        next if depth_first.include?(graph[node][i])

        start = i
        break
      end
      break if start.negative?

      push_to_stack(start, stack, depth_first, graph[node])

      node = graph[node][start]
    end
    stack.empty? ? break : node = stack.shift
  end
  depth_first
end

def push_to_stack(start, stack, depth_first, nodes)
  (start + 1..nodes.length - 1).each do |i|
    stack << nodes[i] unless stack.include?(nodes[i]) || depth_first.include?(nodes[i])
  end
  stack
end
# p depth_first_search({ 0 => [1, 2], 1 => [0, 3, 4], 2 => [0, 5, 6], 3 => [1], 4 => [1], 5 => [2], 6 => [2] })
# expected: [0, 1, 3, 4, 2, 5, 6]

# p depth_first_search({
#                        0 => [1, 2],
#                        1 => [0, 3, 4],
#                        2 => [0, 5, 6],
#                        3 => [1],
#                        4 => [1, 5],
#                        5 => [2, 4],
#                        6 => [2]
#                      })

# expected: [0, 1, 3, 4, 5, 2, 6]

# p depth_first_search({ 0 => [1, 2], 1 => [0, 2], 2 => [0, 1, 3, 4, 5], 3 => [2, 4], 4 => [3, 2], 5 => [2] })
# expected: [0, 1, 2, 3, 4, 5]

# p depth_first_search({
#                        0 => [2],
#                        1 => [4],
#                        2 => [5, 0, 3],
#                        3 => [2],
#                        4 => [1, 5],
#                        5 => [4, 2]
#                      })
# => [0, 2, 5, 4, 1, 3]

p depth_first_search({
                       0 => [2],
                       1 => [4],
                       2 => [5, 0, 3, 6],
                       3 => [2],
                       4 => [1, 5],
                       5 => [4, 2],
                       6 => [2]
                     })
# => [0, 2, 5, 4, 1, 3, 6]
