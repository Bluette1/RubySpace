# Ruby program to solve N Queen Problem using
# backtracking
# Original solution can be found at
# https://www.geeksforgeeks.org/n-queen-problem-backtracking-3/
class NQueenProblem
  N = 4

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

  # rubocop:disable Metrics/CyclomaticComplexity
  # rubocop:disable Metrics/PerceivedComplexity
  def safe(board, row, col)
    (0..col - 1).each do |idx|
      return false if board[row][idx] == 1
    end

    rw = row
    cl = col
    while rw >= 0 && cl >= 0
      return false if board[rw][cl] == 1

      rw -= 1
      cl -= 1
    end

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

  def solve_nq_util(board, col)
    return true if col >= N

    (0..N - 1).each do |idx|
      next unless safe(board, idx, col)

      board[idx][col] = 1
      return true if solve_nq_util(board, col + 1)

      board[idx][col] = 0
    end
    false
  end

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
