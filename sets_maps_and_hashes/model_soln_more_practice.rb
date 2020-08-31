def find_pairs(array, sum)
  pairs = []

  array.each_with_index do |x, index|
    array[(index + 1)..-1].each do |y|
      pairs.push([x, y]) if x + y == sum
    end
  end

  pairs
end

p find_pairs([1, 9, 11, 13, 2, 3, 7], 12)
# => [[1, 11], [9, 3]]
