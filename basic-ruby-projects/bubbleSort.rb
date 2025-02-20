def bubbleSort(arr)
  for _ in (0..arr.length - 1)
    arr.each_with_index do |_val, index|
      next unless index < arr.length - 1

      arr[index], arr[index + 1] = arr[index + 1], arr[index] if arr[index] > arr[index + 1]
    end
  end
  arr
end

print bubbleSort([14, 51, 42, 58, 65, 88, 55, 38, 27, 84, 52, 3, 56, 87, 62, 54, 71, 69, 53, 50, 5, 95, 96, 83, 37])

puts
