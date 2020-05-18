#
# Task: find the smallest number by rearranging digits of a given number.
# The method used is similar to counting sort/bin sort. An array is used to store the frequencies or counts
# of each of the digits of the given number n in the range 0...9. This achieves the sorting for us.
# When computing the smallest permutation, we initialise the result as a string at first,
#  and iterate through the array of digits to extract digits.
# For the first position of the result, the index 0 is skipped (since we
# don't want the result to start with zero). Therefore we first fill the first
# position with the next smallest number after 0.
# After filling the first position of the result string, we fill up the remaining positions of the result string
# by iterating through the array from start to end, and extracting the digits as per their respective frequencies.
# Finally convert the result string to an integer before returning it.
class SmallestPermutation
  def self.find_smallest(num) # rubocop:todo Metrics/MethodLength
    # Initialise an array store the frequencies or counts of each of the digits of the given number
    # n in the range 0...9. In the begininning the frequency of each digit is set to zero
    array_n = [0] * 10
    while num.positive?
      idx = num % 10
      array_n[idx] += 1
      num /= 10
    end

    # We initialise the result as a string at first
    str_res = ''
    # If there's a zero in the given number, we skip it, and iterate through the array in search
    #  for the next smallest digit to fill up the first position in the result
    if array_n[0].positive? # Check if the count or frequency of 0 is greater than 0
      i = 1
      i += 1 while array_n[i].zero?
      str_res = i.to_s
      array_n[i] -= 1 # Decrement the frequency/count of of that digit
    end

    # After filling the first position of the result string, we fill up the remaining positions of the result string
    # by iterating through the array from start to end.
    (0..9).each do |j|
      next unless array_n[j].positive? # Check if the count or frequency of the digit i is greater than 0

      while array_n[j].positive?
        str_res << j.to_s # Extract digit and add it to the result string
        array_n[j] -= 1 # Decrement the frequency/count of of that digit
      end
    end

    str_res.to_i # Finally convert the result string to an integer before returning it
  end
end
