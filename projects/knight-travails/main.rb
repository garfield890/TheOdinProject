require "debug"

adj_list = Array.new(64) { [] }

# populate adj list with possible knight squares
(0...8).each do |i|
  (0...8).each do |j|
    adj_list[(i * 8) + j] << [i - 1, j + 2] if i - 1 >= 0 && j + 2 >= 0 && i - 1 < 8 && j + 2 < 8
    adj_list[(i * 8) + j] << [i - 2, j + 1] if i - 2 >= 0 && j + 1 >= 0 && i - 2 < 8 && j + 1 < 8
    adj_list[(i * 8) + j] << [i - 1, j - 2] if i - 1 >= 0 && j - 2 >= 0 && i - 1 < 8 && j - 2 < 8
    adj_list[(i * 8) + j] << [i - 2, j - 1] if i - 2 >= 0 && j - 1 >= 0 && i - 2 < 8 && j - 1 < 8
    adj_list[(i * 8) + j] << [i + 1, j + 2] if i + 1 >= 0 && j + 2 >= 0 && i + 1 < 8 && j + 2 < 8
    adj_list[(i * 8) + j] << [i + 2, j + 1] if i + 2 >= 0 && j + 1 >= 0 && i + 2 < 8 && j + 1 < 8
    adj_list[(i * 8) + j] << [i + 1, j - 2] if i + 1 >= 0 && j - 2 >= 0 && i + 1 < 8 && j - 2 < 8
    adj_list[(i * 8) + j] << [i + 2, j - 1] if i + 2 >= 0 && j - 1 >= 0 && i + 2 < 8 && j - 1 < 8
  end
end

# binding.break
def bfs(adj_list, start, final)
  queue = Queue.new
  visited = Array.new(adj_list.size, false)
  parent = Array.new(adj_list.size, nil)

  visited[(start[0] * 8) + start[1]] = true
  queue.push((start[0] * 8) + start[1])

  until queue.empty?
    curr = queue.pop
    if curr == ((final[0] * 8) + final[1])
      return reconstruct_path(parent, (start[0] * 8) + start[1], (final[0] * 8) + final[1])
    end

    adj_list[curr].each do |pair|
      next if visited[(pair[0] * 8) + pair[1]]

      visited[(pair[0] * 8) + pair[1]] = true
      parent[(pair[0] * 8) + pair[1]] = curr
      queue.push((pair[0] * 8) + pair[1])
    end
  end
end

def reconstruct_path(parent, start_idx, final_idx)
  path = []
  curr = final_idx
  while curr != start_idx
    path << curr
    curr = parent[curr]
  end
  path << start_idx
  path.reverse
end

def knight_moves(adj_list, start, final)
  bfs(adj_list, start, final)
end

path = knight_moves(adj_list, [3, 3], [0, 7])

if path.nil?
  puts "No valid path found!"
else
  puts "You made it in #{path.size - 1} moves! Here's your path: "
  puts path
end
