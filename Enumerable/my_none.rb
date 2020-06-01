module Enumerable
    def my_each
        return to_enum(:my_each) unless block_given?
        for item in self
          yield item
        end
      end
    def my_none?(arg=nil) 
        answer = true
        if block_given?
         my_each do |item|
            next unless yield item
            return false
          end
          return answer
        else
          if arg.nil?
           my_each do |item|
              next if item.nil? or item == false

              return false
            end
            return answer
          end
          if arg.is_a?(Class)
           my_each do |item|
              next unless item.is_a?(arg)
    
              return false
            end
            return answer
          end
    
            my_each do |item|
              next unless arg =~ item
              return false
            end
        end
        answer
      end
    end

puts "none?::::::::::::::::::::::::::::::::"
puts %w{ant bear cat}.none? { |word| word.length == 5 } 
puts %w{ant bear cat}.none? { |word| word.length >= 4 }
puts %w{ant bear cat}.none?(/d/)                        #=> true
puts [1, 3.14, 42].none?(Float)                         #=> false
puts [].none?                                           #=> true
puts [nil].none?                                        #=> true
puts [nil, false].none?                                 #=> true
puts [nil, false, true].none?                           #=> false

puts "my_none?::::::::::::::::::::::::::::::::"
puts %w{ant bear cat}.my_none? { |word| word.length == 5 } 
puts %w{ant bear cat}.my_none? { |word| word.length >= 4 }
puts %w{ant bear cat}.my_none?(/d/)                        #=> true
puts [1, 3.14, 42].my_none?(Float)                         #=> false
puts [].my_none?                                           #=> true
puts [nil].my_none?                                        #=> true
puts [nil, false].my_none?                                 #=> true
puts [nil, false, true].my_none?                           #=> false