=begin
Task: Create a function that takes a positive integer and returns the next bigger number that can be formed by 
rearranging its digits. Where there's no next bigger number return -1.
If the number has only 1 digit, return -1.
The next bigger number will always be a result of swapping the last two digits of the given number,
if the last digit is bigger than the second last digit.
If the last digit is smaller than or equal to the the second last digit, return -1.
=end
class NextBiggerNumber

    def self.find_next_bigger(num)

        number = num
        length = number.to_s.length

        # First define last and second_last
        # Last and second_last are determined when we find the first interchangeable adjacent pair of digits and then exit the loop, 
        # or if we reach the first position of the number without finding an interchangeable adjacent pair of digits
        
        last = 0
        second_last = 0
        idx = 0

        while last <= second_last and idx < length
            last = num % 10
            second_last = (num / 10) % 10
            num = num / 10
            idx += 1

            if second_last == 0 
                return -1 # a next bigger permutation of the number doesn't exist
            end
        end

        # a next bigger permutation of the number exists
        res_str = number.to_s.split('')
        res_str[length - idx] = second_last
        res_str[length - idx - 1] = last
        res_str.join('').to_i
    end
end