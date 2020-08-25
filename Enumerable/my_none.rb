module Enumerable
    def my_none? *arg
        answer = true
        if block_given?
            for item in self
                next unless yield item
                answer = false
                break
            end
            answer
        else
            # check if no arguments were passed
            if arg.length === 0
                # puts answer, "answer:::::::::::::::::::::::::::::::::::::::"
                for item in self
                    if not (item.nil? or item === false)
                        # puts item, ": Yes!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
                        answer = false
                        return answer
                    end
                end
                # puts answer, "answer:::::::::::::::::::::::::::::::::::::::"
                return answer
            end
            # check if the arg object is a Class
            if arg[0].is_a?(Class) 
                puts "Yes!!!!"
                for item in self
                    next unless item.is_a?(arg[0])
                    answer = false
                    return answer
                end
                return answer
            end

            begin
                for item in self
                    Regexp.compile(arg[0])
                    next unless arg[0] =~ item
                    answer = false
                    break  
                end
                
            rescue => exception
                puts "Invalid regex. Please use a valid regex string", exception
                return
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