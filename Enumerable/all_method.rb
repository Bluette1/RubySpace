module Enumerable
    
    def my_all? *arg
        answer = true
        if block_given?
            for item in self
                if not yield item
                    answer = false
                    break
                end
            end
        else
            # check if the object is a Class
            if arg[0].is_a?(Class) 
                puts "Yes!!!!"
                for item in self
                    next unless not (item.is_a?(arg[0]))
                    answer = false
                    return answer
                end
                return answer
            end

          
            begin
                for item in self
                    Regexp.compile(arg[0])
                    next unless (arg[0] =~ item).nil?
                    # if arg[0] =~ item
                    #     next
                    # end
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

puts  "all?::::::::::::::::::::"
# puts %w[ant bear cat].all? { |word| word.length >= 3 } 
# puts %w[ant bear cat].all? { |word| word.length >= 4 } 
# puts  "all?:::Regex:::::::::::::::::"
# puts %w[ant bear cat].all?(/t/)                        
# puts %w[ant beat cat].all?(/t/)   
# puts %w[ant beat cat].my_all?('*')   
puts %w[ant beat cat].my_all?("BOOM/")  
puts [1, 2i, 3.14].all?(Numeric)    
puts %w[ant bear cat].my_all?(String)   

puts  "my_all?::::::::::::::::::::"
# puts %w[ant bear cat].my_all? { |word| word.length >= 3 } 
# puts %w[ant bear cat].my_all? { |word| word.length >= 4 } 
# puts  "my_all?:::Regex:::::::::::::::::"
# puts %w[ant bear cat].my_all?(/t/)                        
# puts %w[ant beat cat].my_all?(/t/)                       
# puts %w[ant beat cat].my_all?('*')   
puts %w[ant beat cat].my_all?("BOOM/")   
puts [1, 2i, 3.14].my_all?(Numeric) 
puts %w[ant bear cat].my_all?(String)  