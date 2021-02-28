# Ruby program to solve N Queen Problem using
# backtracking
# Original solution can be found at
# https://www.geeksforgeeks.org/n-queen-problem-backtracking-3/
class NQueenProblem
  N = 4
  # A utility function to print solution
  def print(board)
    board_str = ''
    (0..board.length - 1).each do |row|
      line = ''
      (0..board[row].length - 1).each do |col|
        line += board[row][col].to_s
      end
      board_str += line + "\n"
    end
    board_str
  end

  # A utility function to check if a queen can
  #      be placed on board[row][col]. Note that this
  #      function is called when "col" queens are already
  #      placed in columns from 0 to col - 1. So we need
  #      to check only left side for attacking queens
  # rubocop:disable Metrics/CyclomaticComplexity
  # rubocop:disable Metrics/PerceivedComplexity
  def safe(board, row, col)
    # Check this row on left side
    (0..col - 1).each do |idx|
      return false if board[row][idx] == 1
    end
    # Check upper diagonal on left side
    rw = row
    cl = col
    while rw >= 0 && cl >= 0
      return false if board[rw][cl] == 1

      rw -= 1
      cl -= 1
    end
    # Check lower diagonal on left side
    rw = row
    cl = col
    while rw < N && cl >= 0
      return false if board[rw][cl] == 1

      rw += 1
      cl -= 1
    end
    true
  end
  # rubocop:enable Metrics/CyclomaticComplexity
  # rubocop:enable Metrics/PerceivedComplexity

  # A recursive utility function to solve N
  # Queen problem
  def solve_nq_util(board, col)
    # base case: If all queens are placed
    # then return true
    return true if col >= N

    # Consider this column and try placing
    # this queen in all rows one by one
    (0..N - 1).each do |idx|
      # Check if the queen can be placed on
      # board[i][col]
      next unless safe(board, idx, col)

      # Place this queen in board[idx][col]
      board[idx][col] = 1
      # recur to place rest of the queens
      return true if solve_nq_util(board, col + 1)

      # If placing queen in board[i][col]
      # doesn't lead to a solution then
      # remove queen from board[idx][col] / BACKTRACK
      board[idx][col] = 0
    end
    # If the queen can not be placed in any row in
    # this colum col, then return false
    false
  end

  # This function solves the N Queen problem using
  #      Backtracking.  It mainly uses solve_nq_util () to
  #      solve the problem. It returns false if queens
  #      cannot be placed, otherwise, return true and
  #      prints placement of queens in the form of 1s.
  #      Please note that there may be more than one
  #      solutions, this function prints one of the
  #      feasible solutions.

  def solve_nq
    board = [[0, 0, 0, 0], [0, 0, 0, 0], [0, 0, 0, 0], [0, 0, 0, 0]]
    puts "Starting NQueenProblem: N = #{N}..."
    puts print(board)
    unless solve_nq_util(board, 0)
      puts 'Solution does not exist'
      return false
    end
    puts 'Solution is:'
    puts print(board)
    true
  end
end
qn = NQueenProblem.new
qn.solve_nq
