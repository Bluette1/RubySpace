# Task: Create a function that takes a positive integer and returns the next bigger number that can be formed by
# rearranging its digits. Where there's no next bigger number return -1.
# If the number has only 1 digit, return -1.
# If there are only 2 digits:
#     - The next bigger number will always be a result of swapping these two digits,
#     if the last digit is bigger than the second last digit
# We use this same drift to compute the answer for larger numbers
#     - Create variables: `last` and `second_last` to mark adjacent positions as
#     we iterate through the digits of the number, for example if n = 89, last = 9, and second_last = 8.
#     - We iterate through the digits of the number from right to left until we find a
#     a bigger adjacent digit to the right of `last`
#     - If we reach the end of the number without finding an interchangeable adjacent pair of digits, return -1.
#     - After finding the interchangeable pair, we sort all the digits to the right of  `second_last`
#     - We swap `second_last` with the smallest bigger digit to the right of `second_last`
class NextBiggerNumber
  def self.do_counting_sort(num)
    array_n = [0] * 10
    while num.positive?
      idx = num % 10
      array_n[idx] += 1
      num /= 10
    end

    # Extract the digits
    sorted_str = ''
    (0..9).each do |i|
      while array_n[i].positive?
        sorted_str << i.to_s
        array_n[i] -= 1
      end
    end
    sorted_str
  end

  def self.find_smallest_bigger(num, right)
    (0..right.length - 1).each do |i|
      return i if right[i] > num
    end
  end

  def self.find_next_bigger(num) # rubocop:todo Metrics/MethodLength
    number = num
    length = number.to_s.length

    # First define last and second_last
    # Last and second_last are determined when we find the first interchangeable adjacent pair
    # of digits and then exit the loop,
    # or if we reach the first position of the number without finding an interchangeable adjacent pair of digits

    last = 0
    second_last = 0
    idx = 0
    while last <= second_last and idx < length
      last = num % 10
      second_last = (num / 10) % 10
      num /= 10
      idx += 1
    end

    # if we reached the end of the number without finding a bigger adjacent digit to the right of `last`
    if second_last.zero? and idx == length
      return -1 # a next bigger permutation of the number doesn't exist
    end

    # a next bigger permutation of the number exists
    res_str = number.to_s.split('')
    bit_to_sort = res_str[length - idx..length - 1]

    # sort the items to the right of second_last
    sorted_str = do_counting_sort(bit_to_sort.join('').to_i)

    # find the smallest bigger number to the right of second_last
    smallest_bigger_idx = find_smallest_bigger(res_str[length - idx - 1], sorted_str.split(''))
    res_str[length - idx - 1] = sorted_str[smallest_bigger_idx]
    sorted_str[smallest_bigger_idx] = second_last.to_s
    (res_str[0..length - idx - 1].join('') << sorted_str).to_i
  end
end
