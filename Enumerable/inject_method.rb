module Enumerable
    def my_inject *args
        if args.length == 0
            if block_given?
                product =  self.first
                i = 0
                for item in self
                    i += 1
                    next if i == 1
                    product = yield product, item
                end  
                return product        
            end
        else
            if block_given?
                product =  args[0]
                # i = 0
                for item in self
                    # i += 1
                    # next if i == 1
                    product = yield product, item
                end  
                return product        
            end
            # if symbol is given
            if args.length == 2
                result = args[0]
                for item in self
                    result = result.send(args[1], item)
                end
                return result
            end
            # print args.count, "args count:::::::::::::"
            result = self.first
            i = 0
            for item in self
                i += 1
                next if i == 1
                result = result.send(args[0], item)
            end  
            return result 
        end
        
        

        product = args[0]
        for item in self
            product = yield product, item
        end

        product
    end
end

puts "inject:::::::::::::"
puts (5..10).inject(:+)      
puts (5..10).inject(1) { |product, n| product * n }
puts (5..10).inject { |product, n| product * n }

puts "my_inject:::::::::::::"
puts (5..10).my_inject(:+)   
puts (5..10).my_inject(:*)   
puts (5..10).my_inject(1, :*)   
puts (5..10).my_inject(1) { |product, n| product * n }
puts (5..10).my_inject { |product, n| product * n }

def multiply_els array
    array.my_inject(1) { |product, n| product * n }
end
puts multiply_els([2,4,5])  