MOVES = [[1,2],[1,-2],[-1,2],[-1,-2],[2,1],[2,-1],[-2,1],[-2,-1]]

def knights_traversal(start, target)
  path = bfs(start,target)
  puts "You made it in #{path.length - 1} moves!: Here's your path:"
  path.each {|vertex| p vertex}
end

def valid_move?(pos)
  pos[0].between?(0, 7) && pos[1].between?(0, 7)
end

def bfs(start, target)
  queue = [[start]]
  visited = Set.new([start])
  while !queue.empty?
    path = queue.shift
    curr = path[-1]
    return path if curr == target
    visited, queue = test_moves(curr, visited, path, queue)  
  end
end

def test_moves(curr, visited, path, queue)
  MOVES.each do |move|
    test = [curr[0] + move[0], curr[1] + move[1]]
    if valid_move?(test) && !visited.include?(test)
      visited.add(test)
      queue.push(path + [test])
    end
  end
  return [visited, queue]
end

