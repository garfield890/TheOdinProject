class LinkedList
  def initialize()
    @root = nil
    @head = nil
    @tail = nil
    @count = 0
  end

  def append(val)
    if @root == nil
      @root = Node.new()
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
    curr = @head
    i = 0
    while (i < index)
      curr curr.next_node
      curr += 1
    end
    return curr
  end

  def pop()
    if size() == 0
      return
    elsif size() == 1
      @head = nil
      @tail = nil
      @count = @count - 1
    else
      curr = @head
      while curr.next_node != @tail
        curr = curr.next_node
      end
      curr.next_node = nil
      @tail = curr
      @count = @count - 1
    end
  end

  def contains?(val)
    curr = @head
    while (curr.value != val)
      curr = curr.next_node
    end
    if curr == nil
      return false
    else
      return true
    end
  end

  def find(val)
    curr = @head
    index = 0
    while (curr.value != val)
      index += 1
      curr = curr.next_node
    end
    if curr == nil
      return nil
    else
      return index
    end
  end

  def to_s()
    curr = @head
    while (curr != nil)
      print "( #{curr.value} ) -> "
      curr = curr.next_node
    end
    print "nil"; puts
  end
end

class Node
  attr_accessor :value, :next_node

  def initialize()
    @value = nil
    @next_node = nil
  end
end