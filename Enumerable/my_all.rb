module Enumerable
    
  def my_all?(arg=nil)
    # return to_enum(:my_each) unless block_given? or arg
    answer = true
    if block_given?
      each do |item|
        unless yield item
            return false
        end
      end
      return answer
    else
      if arg.nil?
        each do |item|
          next unless item.nil? or item == false
          return false
        end
        return answer
      end
      if arg.is_a?(Class)
        each do |item|
          next if item.is_a?(arg)
          return false
        end
        return answer
      end
    each do |item|
        next unless (arg =~ item).nil?

        return false
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
# puts %w[ant beat cat].my_all?("BOOM/")  
# puts [1, 2i, 3.14].all?(Numeric)    
# puts %w[ant bear cat].my_all?(String)   
puts [nil, true, 99].all?   
puts [1, true, 99].all? 
puts [].all?

puts  "my_all?::::::::::::::::::::"
# puts %w[ant bear cat].my_all? { |word| word.length >= 3 } 
# puts %w[ant bear cat].my_all? { |word| word.length >= 4 } 
# puts  "my_all?:::Regex:::::::::::::::::"
# puts %w[ant bear cat].my_all?(/t/)                        
# puts %w[ant beat cat].my_all?(/t/)                       
# puts %w[ant beat cat].my_all?('*')   
# puts %w[ant beat cat].my_all?("BOOM/")   
# puts [1, 2i, 3.14].my_all?(Numeric) 
# puts %w[ant bear cat].my_all?(String)  
puts [nil, true, 99].my_all? 
puts [1, true, 99].my_all? 
puts [].my_all?