class LinkedList
  def initialize
    @root = nil
    @head = nil
    @tail = nil
    @count = 0
  end

  def append(val)
    if @root.nil?
      @root = Node.new
      @root.value = val
      @head = @root
      @tail = @root
    else
      new_node = Node.new
      new_node.value = val
      @tail.next_node = new_node
      @tail = new_node
    end
    @count += 1
  end

  def prepend(val)
    if @root.nil?
      @root.value = val
      @head = @root
      @tail = @root
    else
      new_node = Node.new
      new_node.value = val
      new_node.next_node = @head
      @head = new_node
    end
    @count += 1
  end

  def size
    @count
  end

  attr_reader :head, :tail

  def at(index)
    curr = @head
    i = 0
    while i < index
      curr curr.next_node
      curr += 1
    end
    curr
  end

  def pop
    if size.zero?
      nil
    elsif size == 1
      @head = nil
      @tail = nil
      @count -= 1
    else
      curr = @head
      curr = curr.next_node while curr.next_node != @tail
      curr.next_node = nil
      @tail = curr
      @count -= 1
    end
  end

  def contains?(val)
    curr = @head
    curr = curr.next_node while curr.value != val
    return false if curr.nil?

    true
  end

  def find(val)
    curr = @head
    index = 0
    while curr.value != val
      index += 1
      curr = curr.next_node
    end
    return nil if curr.nil?

    index
  end

  def to_s
    curr = @head
    until curr.nil?
      print "( #{curr.value} ) -> "
      curr = curr.next_node
    end
    print "nil"
    puts
  end
end

class Node
  attr_accessor :value, :next_node

  def initialize
    @value = nil
    @next_node = nil
  end
end
