# Connected Components
# Are all the components connected on the given Graph?

# A graph is considered one connected component if every node is connected
# along a path with every other node.

# The following graph is not one connected component, since the 1 and 4 cannot be reached
# from the 0,2,3 and 5.

# Challenge
# Given a graph, return true if the graph is one connected component, and false otherwise.
# By using a search algorithm (BFS/DFS), you can traverse through the entire graph
# and save visited nodes. If you visited all nodes listed in the original graph, it means
# that all of them are connected.

# Example
# graph = {
#   0 => [2],
#   1 => [4],
#   2 => [0, 5, 3],
#   3 => [5, 2],
#   4 => [5, 1],
#   5 => [4, 2, 3]
# }

# puts connected_graph?(graph)
# => true
def bfs(graph)
  breadth_first = []
  node = graph.keys[0]

  queue = Queue.new
  breadth_first << node
  # Add first item to the queue
  queue << node

  until queue.empty?
    # Take item off the queue
    node = queue.pop
    graph[node].each do |item|
      next if breadth_first.include?(item)

      breadth_first << item
      # Add the item to the queue
      queue << item
    end
  end
  breadth_first
end

def connected_graph?(graph)
  # Use bfs or dfs to visit all the nodes in the tree
  # If the number of nodes visited equates the total number of nodes
  # in the tree, then the graph is a connected component.
  bfs(graph).length == graph.keys.length
end

puts connected_graph?({
                        0 => [2],
                        1 => [4],
                        2 => [0, 5, 3],
                        3 => [5, 2],
                        4 => [5, 1],
                        5 => [4, 2, 3]
                      })
# => true

puts connected_graph?({
                        0 => [1, 2],
                        1 => [0, 2],
                        2 => [0, 1, 3, 4, 5],
                        3 => [2, 4],
                        4 => [3, 2],
                        5 => [2]
                      })
# => true
