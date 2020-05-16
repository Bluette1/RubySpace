=begin
    This will sort the elements of an array of integers using Bubble Sort.
    The array is traversed while comparing adjacent elements and swapping
    their positions where necessary. After each traversal we decrement the
    position of the last index.
=end

def bubble_sort_by_concept_one array
    n = array.length;

    while n > 0 

        j = 0;

        for k in 1..n - 1

            compare_result = yield array[j], array[k]

            # if array[j] > array[k], swap these two values
            if compare_result > 0
                store = array[j];
                array[j] = array[k];
                array[k] = store;
            end
            j += 1;
        end
        n -= 1; # last element is now sorted
    end

    array
end

# Call the bubble sort by concept one method with a block
result_one = bubble_sort_by_concept_one(["hi","hello","hey"]) do |left,right|
     left.length - right.length
    end
print result_one, "\n"

=begin
    This will sort the elements of an array of integers using Bubble Sort.
    The array is traversed while comparing adjacent elements and swapping
    their positions where necessary. In this method we repeat the procedure
    until there are no more swaps
=end
def bubble_sort_by_concept_two array
    no_swaps = false #initiate flag to indicate when there are no more swaps being done
 
    until no_swaps do
        no_swaps = true 
        for i in 0..array.length - 2

            # check if these two elements are out of order
            compare_result = yield array[i], array[i + 1]

            if compare_result > 0  
                
                # do a swap
                store = array[i]
                array[i] = array[i + 1]
                array[i + 1] = store
                no_swaps = false
            end
        end
    end

    array
end

# Call the bubble sort by concept two method with a block
result_two = bubble_sort_by_concept_two(["hi","hello","hey"]) do |left,right|
    left.length - right.length
   end
print result_two, "\n"