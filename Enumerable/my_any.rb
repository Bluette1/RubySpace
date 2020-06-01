module Enumerable
    def my_each
        return to_enum(:my_each) unless block_given?
        for item in self
          yield item
        end
      end
      
  def my_any?(arg=nil)
    answer = false
    if block_given?
      my_each do |item|
        next unless yield item
        return true
      end
    else
      if arg.nil?
        my_each do |item|
          next unless !item.nil? or item == true
          return true
        end
        return answer
      end
      if arg.is_a?(Class)
        my_each do |item|
          next unless item.is_a?(arg)
        return true
        end
        return answer
      end
        my_each do |item|
          next unless arg =~ item

          return true
        end

    end
    answer
  end
end
puts  "any?::::::::::::::::::::"
puts %w[ant bear cat].any? { |word| word.length >= 3 } 
puts %w[ant bear cat].any? { |word| word.length >= 4 } 
puts %w[ant bear cat].any?(/d/)                        #=> false
puts [nil, true, 99].any?(Integer)                     #=> true
puts [nil, true, 99].any?                              #=> true
puts [].any?                                           #=> false


puts  "my_any?::::::::::::::::::::"
puts %w[ant bear cat].my_any? { |word| word.length >= 3 } 
puts %w[ant bear cat].my_any? { |word| word.length >= 4 } 
puts %w[ant bear cat].my_any?(/d/)                        #=> false
puts [nil, true, 99].my_any?(Integer)                     #=> true
puts [nil, true, 99].my_any?                              #=> true
puts [].my_any?                                           #=> false

