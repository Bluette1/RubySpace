=begin
Recursively solve the subproblem of moving disks 1 and 2 from peg B to the spare peg,
peg A. (Move disk 1 from peg B to peg C; move disk 2 from peg B to peg A; move disk 1
from peg C to peg A.)
Now that disk 3 is exposed on peg B, move to it peg C.
Recursively solve the subproblem of moving disks 1 and 2 from peg A to peg C.
(Move disk 1 from peg A to peg B; move disk 2 from peg A to peg C;move disk 1 from peg B to peg C.)   

Towers of Hanoi - Part 2:

We just covered the Towers of Hanoi for Case 1 and Case 2, let’s return to 3 disks. 
Can you describe an algorithm to move the 3 disks from a starting peg to the goal peg?
You can refer back to solved cases when needed. Think about the solution before continuing.
The Algorithm for 3 disks:
 - Move the top 2 disks to the intermediate peg. How? Refer to Case 2.
 - Move the bottom Disk to the Goal Peg. (See case 1)
 - Move the 2 disks from the intermediate peg to the goal peg. How? Refer to Case 2.
Now that we’ve covered 1, 2 and 3 disks, can you figure out an algorithm for solving the towers of Hanoi for any number of N disks?
=end

=begin
Challenge

Create a program that solves the tower of Hanoi. You will be given one number as input - the number of disks on Peg 1. 
Create a method that prints a string with the correct steps to solve the puzzle.


Output Format

Print the peg to move from, an arrow "->", and the peg to move to. For example, to move from peg 1 to peg 3, print:
1->3.
Print a string with all the steps, each step on its own line.


Examples

hanoi_steps(2)
# => 1->2 
#    1->3 
#    2->3

hanoi_steps(3)
# => 1->3 
#    1->2
#    3->2
#    1->3
#    2->1
#    2->3
#    1->3

hanoi_steps(4)
# => 1->2 
#    1->3 
#    2->3
#    1->2
#    3->1
#    3->2
#    1->2
#    1->3
#    2->3
#    2->1
#    3->1
#    2->3
#    1->2
#    1->3
#    2->3
=end

def hanoi_steps(number_of_discs)
    # your code here
end
  
  hanoi_steps(2)
  # => 1->2 
  #    1->3 
  #    2->3
  
  hanoi_steps(3)
  # => 1->3 
  #    1->2
  #    3->2
  #    1->3
  #    2->1
  #    2->3
  #    1->3
  
  hanoi_steps(4)
  # => 1->2
  #    1->3
  #    2->3
  #    1->2
  #    3->1
  #    3->2
  #    1->2
  #    1->3
  #    2->3
  #    2->1
  #    3->1
  #    2->3
  #    1->2
  #    1->3
  #    2->3