module Enumerable
    def my_each
      for item in self
        yield item
      end
    end

    def my_each_with_index
        idx = 0
        for item in self
            yield item, idx
            idx += 1
        end
    end

    def my_select 
        selected = []
        for item in self
           if yield item
                selected.push(item)
           end
        end
        selected
    end

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
            # do a regex test
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

    def my_any?
        answer = false
        for item in self
            next unless yield item
            answer = true
            break
        end

        answer
    end

    def my_none?
        answer = true
        for item in self
            next unless yield item
            answer = false
            break
        end
        answer
    end

    def my_count
        answer = 0
        for item in self
            next unless yield item
            answer += 1
        end
        answer
    end

    def my_map 
        result = []
        for item in self
            result.push yield item
        end
        result
    end

    def my_map_proc proc 
        result = []
        for item in self
            result.push proc.call(item)
        end
        result
    end

    def my_map_proc_block proc
        unless proc.is_a?(Proc)  
            result = []
            for item in self
                result.push yield item
            end
            result
        
        else my_map_proc proc

        end
    end

    def my_inject num
        product = num
        for item in self
            product = yield product, item
        end

        product
    end
end

puts "each:::::::::::::::"
[1,2,3].each do |item|
    puts item + 10
end

puts "my_each::::::::::::::::"
[1,2,3].my_each do |item|
    puts item + 10
end

puts "each_with_index:::::::::::::::"
[1, 2, 3].each_with_index do |item, index|  
print index, item
puts "\n"
end


puts "my_each_with_index:::::::::::::::"
[1, 2, 3].my_each_with_index do |item, index|  
print index, item
puts "\n"
end

puts "select::::::::::::::::"
p [1,2,3,4,5].select {|num|  num.even?} 
p [1,2,3,4,5].select

puts "my_select:::::::::::::"
p [1,2,3,4,5].my_select {|num|  num.even?} 

puts  "all?::::::::::::::::::::"
puts %w[ant bear cat].all? { |word| word.length >= 3 } 
puts %w[ant bear cat].all? { |word| word.length >= 4 } 
puts  "all?:::Regex:::::::::::::::::"
puts %w[ant bear cat].all?(/t/)                        
puts %w[ant beat cat].all?(/t/)      

puts  "my_all?::::::::::::::::::::"
puts %w[ant bear cat].my_all? { |word| word.length >= 3 } 
puts %w[ant bear cat].my_all? { |word| word.length >= 4 } 
puts  "my_all?:::Regex:::::::::::::::::"
puts %w[ant bear cat].my_all?(/t/)                        
puts %w[ant beat cat].my_all?(/t/)                       
puts %w[ant beat cat].my_all?('*')   
puts %w[ant beat cat].my_all?("BOOM/")   


puts  "any?::::::::::::::::::::"
puts %w[ant bear cat].any? { |word| word.length >= 3 } 
puts %w[ant bear cat].any? { |word| word.length >= 4 } 

puts  "my_any?::::::::::::::::::::"
puts %w[ant bear cat].my_any? { |word| word.length >= 3 } 
puts %w[ant bear cat].my_any? { |word| word.length >= 4 } 

puts "none?::::::::::::::::::::::::::::::::"
puts %w{ant bear cat}.none? { |word| word.length == 5 } 
puts %w{ant bear cat}.none? { |word| word.length >= 4 }

puts "my_none?::::::::::::::::::::::::::::::::"
puts %w{ant bear cat}.my_none? { |word| word.length == 5 } 
puts %w{ant bear cat}.my_none? { |word| word.length >= 4 }

puts "count::::::::::::::"
result_count = [1, 2, 4, 2].count do |num|
     num % 2 == 0
end

p result_count
p [1, 2, 4, 2].count
p [1, 2, 4, 2].count(2)

pu

puts "my_count::::::::::::::"
my_result_count = [1, 2, 4, 2].my_count do |num|
    num % 2 == 0
end
p my_result_count
p [1, 2, 4, 2].my_count
p [1, 2, 4, 2].mycount(2)

puts "map:::::::::::::::::::::::::"
p (1..4).map { |i| i*i }      

puts "my_map:::::::::::::::::::::::::"
p (1..4).my_map { |i| i*i }   

puts "my_map_proc_block  when a block is passed:::::::::::::::::::::::::"
p (1..4).my_map_proc_block(nil) { |i| i*i }   

puts "my_map_proc:::::::::::::::::::::::::"
proc = Proc.new do
    |i| i*i
end
p (1..4).my_map_proc proc

puts "my_map_proc_block when a proc is passed:::::::::::::::::::::::::"
proc = Proc.new do
    |i| i*i
end
p (1..4).my_map_proc_block proc


puts "inject:::::::::::::"
puts (5..10).inject(1) { |product, n| product * n }

puts "my_inject:::::::::::::"
puts (5..10).my_inject(1) { |product, n| product * n }

def multiply_els array
    array.my_inject(1) { |product, n| product * n }
end
puts multiply_els([2,4,5]) 
