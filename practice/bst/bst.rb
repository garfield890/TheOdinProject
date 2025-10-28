require 'thread'

class Node
  attr_accessor :data, :left, :right
  def initialize(data)
    @data = data
    @left = nil
    @right = nil
  end
end

class Tree
  def initialize(arr)
    @arr = arr
    @root = nil
    @size = @arr.length
  end

  def build_tree(array)
    if array.length <= 0
      return
    end
    array = array.sort
    mid = (left + right) / 2
    root = Node.new(array[mid])

    root.left = build_tree(array[0..mid-1])
    root.right = build_tree(array[mid+1..@size-1])
    return root
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end

  def insert(data)
    new_node = Node.new(data)
    if @root.nil?
      @root = new_node
      return
    end

    curr = @root
    while curr
      if data < curr.data
        if curr.left.nil?
          curr.left = new_node
          return
        else
          curr = curr.left
        end
      else
        if curr.right.nil?
          curr.right = new_node
          return
        else
          curr = curr.right
        end
      end
    end
  end

  def delete(data)
    prev = @root
    curr = nil
    if (prev.data > data)
      curr = prev.left
    else
      curr = prev.right
    end

    while (curr.data != data)
      if data > curr.data
        curr = curr.right
        prev = prev.right
      else
        curr = curr.left
        prev = prev.left
      end
    end

    if curr.left.nil? && curr.right.nil?
      if (curr == prev.left)
        prev.left = nil
      else
        prev.right = nil
      end
    elsif (!curr.left.nil? && curr.right.nil?) || (curr.left.nil? && !curr.right.nil?)
      if (prev.left == curr && !curr.right.nil?)
        prev.left = curr.right
      elsif (prev.left == curr && !curr.left.nil?)
        prev.left = curr.left
      elsif (prev.right == curr && !curr.right.nil?)
        prev.right = curr.right
      else
        prev.right = curr.left
      end
    else
      successor_parent = curr
      successor = curr.right
      while successor.left
        successor_parent = successor
        successor = successor.left
      end

      curr.data = successor.data

      if successor_parent.left == successor
        successor_parent.left = successor.right
      else
        successor_parent.right = successor.right
      end
    end
  end

  def find(data)
    curr = @root
    while (!curr.nil?)
      if (data > curr.data)
        curr = curr.right
      elsif data < curr.data
        curr = curr.left
      else
        return curr
      end
    end
    return nil
  end

  def level_order(&block)
    queue = Queue.new
    queue.push(@root)
    arr = []
    while (!queue.empty?)
      if block.nil? 
        curr = queue.pop
        arr << curr.data
        queue.push(curr.left) if curr.left
        queue.push(curr.right) if curr.right
      else
        curr = queue.pop
        yield curr
        queue.push(curr.left) if curr.left
        queue.push(curr.right) if curr.right
      end
    end
    if block.nil? 
      return arr
    end
  end

  def preorder(rootNode = @root, &block)
    if (rootNode.nil?)
      return
    end
    yield rootNode
    preorder(rootNode.left, block)
    preorder(rootNode.right, block)
  end

  def inorder(rootNode = @root, &block)
    if (rootNode.nil?)
      return
    end
    inorder(@root.left, block)
    yield rootNode
    inorder(@root.right, block)
  end

  def postorder(rootNode = @root, &block)
    if (rootNode.nil?)
      return
    end
    postorder(@root.left, block)
    postorder(@root.right, block)
    yield rootNode
  end

  def height(rootNode = @root)
    if rootNode.nil?
      return
    end
    return [height(rootNode.left), height(rootNode.right)].max + 1
  end

  def depth(rootNode)
    max_depth = height()
    heightAtRoot = height(rootNode)
    return max_depth - heightAtRoot
  end

  def balanced?(rootNode = @root)
    
  end
end