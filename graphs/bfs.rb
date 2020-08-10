# Instructions from your teacher:
# Breadth-First Search
# BFS begins at one node in a graph and visits all the neighboring nodes.
# It then goes to each of those neighbors to explore their unvisited neighbors
# in order. So it goes through the entire graph one level at a time, until the whole graph has been visited.

# BFS goes through the Nodes one level at a time, so you need a structure to
# keep track of the next nodes to be processed.

# Q: What structure can be used to access items in the order they were put in?
# A: A Queue

# Challenge
# Return an array with the given graph in BFS order.

# Sample Input
# graph = {
#   0 => [2],
#   1 => [4],
#   2 => [5, 0, 3],
#   3 => [2],
#   4 => [1, 5],
#   5 => [4, 2]
# }

# bfs(graph)
# # => [0, 2, 5, 3, 4, 1]

# Get stuck and need some hint?
# Check this link:
# https://gitlab.com/microverse/guides/coding_challenges/hints/blob/master/challenges/tress_and_graphs/breadth-first-search.md
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
      unless breadth_first.include?(item)
        breadth_first << item
        # Add the item to the queue
        queue << item
      end
    end
  end
  breadth_first
end

p bfs({
        0 => [2],
        1 => [4],
        2 => [5, 0, 3],
        3 => [2],
        4 => [1, 5],
        5 => [4, 2]
      })
# => [0, 2, 5, 3, 4, 1]
