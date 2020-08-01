# Let min = 0 and max = n-1.
# If max < min, then stop: target is not present in array. Return -1.
# Compute guess as the average of max and min, rounded down (so that it is an integer).
# If array[guess] equals target, then stop. You found it! Return guess.
# If the guess was too low, that is, array[guess] < target, then set min = guess + 1.
# Otherwise, the guess was too high. Set max = guess - 1.
# Go back to step 2.
def do_search(targetValue, array)
  min = 0
  max = array.length - 1

  binary_search(targetValue, array, min, max)
end

def binary_search(num, array, min, max)
  if max < min
    -1
  else
    mid = (min + max) / 2

    if array[mid] == num
      mid
    elsif array[mid] > num
      binary_search(num, array, min, mid - 1)
    else
      binary_search(num, array, mid + 1, max)
    end
  end
end

puts do_search(0, [1, 2, 3, 4, 5, 6, 7, 8, 9, 10])
puts do_search(5, [1, 2, 3, 4, 5, 6, 7, 8, 9, 10])
