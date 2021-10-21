def knapsack_recursive_soln(max_wght, wght, val, num)
  return 0 if num == 0 || max_wght == 0
  # If the nth weight of nth solution is greater than the max capacity,
  # return the soln for n-1th weight
  return knapsack_recursive_soln(max_wght, wght, val, num - 1) if wght[num - 1] > max_wght

  [knapsack_recursive_soln(max_wght, wght, val, num - 1),
   knapsack_recursive_soln(max_wght - wght[num - 1], wght, val, num - 1) + val[num - 1]].max
end

def knapsack_dp_soln(max_wght, wght, val, num)
  table = Array.new(num + 1) { Array.new(max_wght + 1, 0) }

  (0..num).each do |row|
    (0..max_wght).each do |col|
      table[row][col] = 0 if row == 0 || col == 0
      table[row][col] = if wght[row - 1] > col
                          table[row - 1][col]
                        else
                          [table[row - 1][col], table[row - 1][col - wght[row - 1]] + val[row - 1]].max
                        end
    end
  end

  table[num][max_wght]
end

val = [60, 100, 120]
wght = [10, 20, 30]
max_wght = 50
num = val.length
p knapsack_recursive_soln(max_wght, wght, val, num)
p knapsack_dp_soln(max_wght, wght, val, num)
