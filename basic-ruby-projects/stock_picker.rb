# frozen_string_literal: true

def stock_picker(arr)
  values = []
  (0..arr.length - 2).each do |i|
    (i + 1..arr.length - 1).each do |j|
      values.push([i, j, arr[j] - arr[i]])
    end
  end
  max_array = values.max_by { |sub_array| sub_array[2] }
  [max_array[0], max_array[1]]
end

print stock_picker([10, 3, 6, 9, 15, 8, 6, 17, 1])
puts
