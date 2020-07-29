=begin
  Challenge
In this challenge, you need to move 2 disks from any starting peg to any goal peg.

You will be given two numbers (from 1 to 3) as input - the starting  peg, and the
goal peg. Write a function that calculates how to move 2  disks from the starting peg
to the goal peg. Return a string with all the steps.

Output Format:

Add the peg to move from, an arrow "->", and the peg to move to.  For example, to move
from peg 1 to peg 3, print "1->3".

Examples

move(1, 3)
# => 1->2 1->3 2->3

move(2, 3)
# => 2->1 2->3 1->3

=end
def move(starting, goal)
  steps = ""
  spare_peg = [1, 2, 3].reject do |x|
    x == starting || x == goal
  end
  spare_peg = spare_peg[0].to_s
  starting = starting.to_s
  goal = goal.to_s

  # Move the first disk from the starting peg to the spare peg
  steps << starting << "->" << spare_peg

  # Move the second disk from the starting peg to the goal peg
  steps << " " << starting << "->" << goal

  # Move the first disk from the spare peg to the goal peg
  steps << " " << spare_peg << "->" << goal
end

puts move(1, 3)
# => 1->2 1->3 2->3

puts move(2, 3)
# => 2->1 2->3 1->3
