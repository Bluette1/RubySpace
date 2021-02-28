# Merge sort algorithm

def full_merge_sort(array)
  merge_sort(array, 0, array.length - 1)
  array
end

def merge_sort(array, start_index, end_index)
  return unless start_index < end_index

  mid_index = (start_index + end_index) / 2

  # Do recursive calls to divide list into sublists
  merge_sort(array, start_index, mid_index)
  merge_sort(array, mid_index + 1, end_index)

  # Sort and merge the sublists
  merge(array, start_index, mid_index, end_index)
end

def merge(array, start_index, mid_index, end_index)
  temp = []
  i_dx = start_index
  j_dx = mid_index + 1

  while i_dx <= mid_index && j_dx <= end_index
    if array[i_dx] < array[j_dx]
      temp << array[i_dx]
      i_dx += 1
    else
      temp << array[j_dx]
      j_dx += 1
    end
  end

  # Add the remaining elements in the left sublist
  add_elements(i_dx, mid_index, temp, array)

  # Add the remaining elements in the right sublist
  add_elements(j_dx, end_index, temp, array)

  # copy elements from temp into array
  (0..temp.length - 1).each do |k_dx|
    array[start_index + k_dx] = temp[k_dx]
  end
end

def add_elements(idx, end_idx, array, source)
  # Add the remaining elements in the left sublist
  while idx <= end_idx
    array << source[idx]
    idx += 1
  end
end
p full_merge_sort([1, 3, 9, 11, 2, 4, 6, 8])
