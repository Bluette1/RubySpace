# Quick-Sort Advanced

# The previous version of Quicksort was easy to understand, but it was
#  not optimal. It required copying the numbers into other arrays, which
#  takes up more space and time. To make things faster, one can create an
#  "in-place" version of Quicksort, where the numbers are all sorted within
#  the array itself.

# Challenge

# Create an in-place version of Quicksort. This time, always select the last
#  element in the 'sub-array' as a pivot. Partition the left side and then the
#  right side of the array. Print out the whole array at the end of every
#  partitioning method.

# Guideline

# Instead of copying the array into multiple sub-arrays, use indices to
#  keep track of the different sub-arrays. You can pass the indices to a
#  modified partition method. The partition method should partition the
#  sub-array and then return the index location where the pivot gets placed,
#  so you can then call partition on each side of the pivot.

# Since you cannot just create new sub-arrays for the elements, Partition will need to use another trick to keep track of which elements are greater and which are smaller than the pivot.

# The In-place Trick

# If an element is smaller than the Pivot, you should swap it with a (larger)
#  element on the left-side of the sub-array. Large elements can just remain
#  where they are, and the pivot can then be inserted in the middle at the end
#  of the partition method. To ensure that you don't swap a small element with
#  another small element, use an index to keep track of the "small" elements.
# Explanation of Sample I/O
# The 5 is initially selected as the pivot, and the array is partitioned
#  as shown in the diagram. The left side is partitioned next, with the 2 as
#  the pivot. Finally the right side is partitioned, with the 8 as the pivot.
#  The entire array is now sorted.

# Challenge
# Create an in-place QuickSort and print the entire array on a new
#  line at the end of every partitioning method

# Example
# advanced_quicksort([1, 3, 9, 8, 2, 7, 5])
# # => 1 3 2 5 9 7 8
# #    1 2 3 5 9 7 8
# #    1 2 3 5 7 8 9

# Get stuck and need some hint?
# Check this link: https://gitlab.com/microverse/guides/coding_challenges/hints/blob/master/challenges/sorting-algorithms/quick-sort-advanced.md
def advanced_quicksort(array)
  quick_sort(array, 0, array.length - 1)
 end
 
 def quick_sort(array, start, ending)
   return array if start >= ending || array.clone.sort == array
 
   idx = partition(array, start, ending)
 
   p array
 
   # sort left side
   quick_sort(array, start, idx - 1)
 
   # sort right side
   quick_sort(array, idx + 1, ending)
 end
 
 def partition(array, start, ending)
   pivot = array[ending]
   smaller_end_idx = start - 1
   j = start
   while j <= ending - 1
 
     # --------------------------------------------------------------------------------
     # swap adjacents into the right positions if they are both smaller
     # ignore the larger
     # swap a smaller value with the first available value in the larger section
     # ----------------------------------------------------------------------------------
     swap_posn = insert_posn smaller_end_idx 
     if array[j] < pivot
       # check if the item is in the sorted region
       swap(array, swap_posn, j) if j != swap_posn
       smaller_end_idx += 1
     end
     j += 1
   end
   swap_posn = insert_posn smaller_end_idx
   swap(array, swap_posn, ending)
   swap_posn
 end
 
 def insert_posn (idx)
   idx + 1
 end

 def swap(array, i, j)
   temp = array[i]
   array[i] = array[j]
   array[j] = temp
 end
 
 
 advanced_quicksort([1, 3, 9, 8, 2, 7, 5])
 # => 1 3 2 5 9 7 8
 #    1 2 3 5 9 7 8
 #    1 2 3 5 7 8 9

# advanced_quicksort([5, 8, 1, 3, 7, 10, 2])
# partition([5], 0, 0)
# partition([5, 2], 0, 1)
# partition([5, 2, 3], 0, 2)
# partition([5, 2, 3, 8], 0, 3)
# partition([5, 8, 1, 3, 7, 10, 2], 0, 6)
# => 2 3
#    1 2 3
#    7 8 10
#    1 2 3 5 7 8 10
# p advanced_quicksort([1, 3, 9, 8, 2, 7, 5])
# partition([1, 3, 9, 8, 2, 7, 5], 0, 6)
# => 1 3 2 5 9 7 8
#    1 2 3 5 9 7 8
#    1 2 3 5 7 8 9

# partition([1, 2, 3, 5, 7, 8, 9], 0, 6)
# partition([1], 0, 0)
# partition([1, 2], 0, 1)
# partition([1, 3, 2, 5, 9, 7, 8], 1, 2)
# partition([1, 2, 3, 5, 9, 7, 8], 4, 6)
# partition([1, 2, 5, 3, 7, 10, 8], 0, 0)
# partition([1, 2, 5, 3, 7, 10, 8], 2, 6)
# partition([1, 3, 2, 5, 9, 7, 8], 4, 6)
advanced_quicksort([9, 8, 6, 7, 3, 5, 4, 1, 2])

# expected block to output "[1, 2, 6, 7, 3, 5, 4, 9, 8]\n[1, 2, 6, 7, 3, 5, 4, 8, 9]\n[1, 2, 3, 4, 6, 5, 7, 8, 9]\n[1, 2, 3, 4, 6, 5, 7, 8, 9]\n[1, 2, 3, 4, 5, 6, 7, 8, 9]\n" to stdout, but output "1 2 6 7 3 5 4 9 8\n"
# Diff:
# @@ -1,6 +1,2 @@
# -[1, 2, 6, 7, 3, 5, 4, 9, 8]

# -[1, 2, 6, 7, 3, 5, 4, 8, 9]

# -[1, 2, 3, 4, 6, 5, 7, 8, 9]
# -[1, 2, 3, 4, 6, 5, 7, 8, 9]

# -[1, 2, 3, 4, 5, 6, 7, 8, 9]

# ❯ ruby advanced_quick_sort.rb
# [1, 2, 6, 7, 3, 5, 4, 9, 8]

# [1, 2, 6, 7, 3, 5, 4, 8, 9]

# [1, 2, 3, 4, 6, 5, 7, 8, 9]
# [1, 2, 3, 4, 6, 5, 7, 8, 9]

# [1, 2, 3, 4, 5, 6, 7, 8, 9]

# ❯ ruby advanced_quick_sort.rb
# [1, 2, 6, 7, 3, 5, 4, 9, 8]
# [1, 2, 6, 7, 3, 5, 4, 9, 8]

# [1, 2, 6, 7, 3, 5, 4, 8, 9]

# [1, 2, 3, 4, 6, 5, 7, 8, 9]
# [1, 2, 3, 4, 6, 5, 7, 8, 9]
# [1, 2, 3, 4, 6, 5, 7, 8, 9]

# [1, 2, 3, 4, 5, 6, 7, 8, 9]

# ❯ ruby advanced_quick_sort.rb
# [1, 2, 6, 7, 3, 5, 4, 9, 8]
# [1, 2, 3, 4, 5, 6, 7, 8, 9]
# [1, 2, 3, 4, 5, 6, 7, 8, 9]
# [1, 2, 3, 4, 5, 6, 7, 8, 9]

# -----------------------------------------------------------------------

# ❯ ruby advanced_quick_sort.rb
# [1, 2, 6, 7, 3, 5, 4, 9, 8]
# [1, 2, 6, 7, 3, 5, 4, 9, 8]
# [1, 2, 6, 7, 3, 5, 4, 8, 9]
# [1, 2, 3, 4, 6, 5, 7, 8, 9]
# [1, 2, 3, 4, 6, 5, 7, 8, 9]
# [1, 2, 3, 4, 6, 5, 7, 8, 9]
# [1, 2, 3, 4, 5, 6, 7, 8, 9]

# ❯ ruby advanced_quick_sort.rb
# [1, 2, 6, 7, 3, 5, 4, 9, 8]
# [1, 2, 6, 7, 3, 5, 4, 9, 8]
# [1, 2, 6, 7, 3, 5, 4, 8, 9]
# [1, 2, 3, 4, 6, 5, 7, 8, 9]
# [1, 2, 3, 4, 6, 5, 7, 8, 9]
# [1, 2, 3, 4, 6, 5, 7, 8, 9]
# [1, 2, 3, 4, 5, 6, 7, 8, 9]

