class LinkedList
  def initialize()
    @root = nil
    @head = nil
    @tail = nil
    @count = 0
  end

  def append(val)
    if @root == nil
      @root.value = val
      @head = @root
      @tail = @root
    else
      new_node = Node.new()
      new_node.value = val
      @tail.next_node = new_node
      @tail = new_node
    end
    @count = @count + 1
  end

  def prepend(val)
    if @root == nil
      @root.value = val
      @head = @root
      @tail = @root
    else
      new_node = Node.new()
      new_node.value = val
      new_node.next_node = @head
      @head = new_node
    end
    @count = @count + 1
  end

  def size()
    return @count
  end

  def head()
    return @head
  end

  def tail()
    return @tail
  end

  def at(index)
    
  end
end

class Node
  attr_accessor :value, :next_node

  def initialize()
    @value = nil
    @next_node = nil
  end

end