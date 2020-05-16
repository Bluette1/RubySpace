=begin
    This will sort the elements of an array of integers using Bubble Sort.
    The array is traversed while comparing adjacent elements and swapping
    their positions where necessary. After each traversal we decrement the
    position of the last index.
=end

def bubble_sort_concept_one array
    n = array.length;

    while n > 0 

        j = 0;

        for k in 1..n - 1

            if array[j] > array[k] # Swap these two values
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

print bubble_sort_concept_one([4,3,78,2,0,2]), "\n"

=begin
    This will sort the elements of an array of integers using Bubble Sort.
    The array is traversed while comparing adjacent elements and swapping
    their positions where necessary. In this method we repeat the procedure
    until there are no more swaps
=end
def bubble_sort_concept_two array
    no_swaps = false #initiate flag to indicate when there are no more swaps being done
 
    until no_swaps do
        no_swaps = true 
        for i in 0..array.length - 2
            if array[i] > array[i + 1] # check if these two elements are out of order
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

print bubble_sort_concept_two([4,3,78,2,0,2]), "\n"