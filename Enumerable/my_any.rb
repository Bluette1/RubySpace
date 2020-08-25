module Enumerable
    def my_any? *arg
        answer = false
        if block_given?
            for item in self
                next unless yield item
                answer = true
                break
            end
        else
            # check if no arguments were passed
            if arg.length == 0
                for item in self
                    if not item.nil? or item === true
                        answer = true
                        return answer
                    end
                end
                return answer
            end
            # check if the arg object is a Class
            if arg[0].is_a?(Class) 
                puts "Yes!!!!"
                for item in self
                    next unless item.is_a?(arg[0])
                    answer = true
                    return answer
                end
                return answer
            end

            begin
                for item in self
                    Regexp.compile(arg[0])
                    next unless arg[0] =~ item
                    answer = true
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

