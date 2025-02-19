#traverse through array twice (O(n^2))

def stock_picker(arr)
  values = []
  for i in (0..arr.length-2)
    for j in (i+1..arr.length-1)
      values.push([i, j, arr[j]-arr[i]])
    end
  end
  max_array = values.max_by { |sub_array| sub_array[2]}
  return [max_array[0], max_array[1]]
end

print stock_picker([10, 3, 6, 9, 15, 8, 6, 17, 1]); puts