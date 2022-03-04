# LinkedList class with methods
class LinkedList
  attr_accessor :head, :tail

  # change starting index number to 0 instead of one
  def initialize
    @head = nil
    @tail = nil
  end

  def append(node)
    if @head.nil?
      # nodes assigned to head and tail. 
      @head = node
    else
      # @tail is the previous node
      @tail.next_node = node
    end
    @tail = node
  end

  def prepend(node)
    if @head.nil?
      @head = node
      @tail = node
    else
      node.next_node = @head
      @head = node
    end
  end
  
  def size
    size = 0
    current = @head
    until current.nil?
      size += 1
      current = current.next_node
    end
    size
  end

  def at(index)
    current = @head
    return 'Empty List' if current.nil?

    # current is already at head i.e. index 0
    index.times { current = current.next_node }
    current
  end

  def pop
    # set the second last node's value to nil, and @tail to second_last node
    current = @head
    (size - 2).times { current = current.next_node }
    @tail = current
    current.next_node = nil
  end

  def contains_recursive(value, current = @head)
    return false if current.nil?
    return true if current.value == value

    contains_recursive(value, current.next_node)
  end

  def contains?(value)
    current = @head
    until current.nil?
      return true if current.value == value
      current = current.next_node
    end
    false
  end

  def find_recursive(value, index = 0, current = @head)
    return nil if current.nil?
    return index if @head.value == value

    find_recursive(value, index + 1, current.next_node)
  end

  def find(value)
    # returns index of found value
    index = 0
    return index if @head.value == value

    current = @head
    until current.next_node.nil?
      index += 1
      current = current.next_node
      return index if current.value == value
    end
    nil
  end

  def to_s
    return nil if @head.nil? 

    current = @head
    output = "#{current.value}" 
    until current.next_node.nil?
      current = current.next_node
      output << " -> #{current.value}"
    end
    output << ' -> nil'
  end

  def insert_at(value, index)
    return puts 'Invalid index number' if index > size
    insert_node = Node.new(value)
    return prepend(insert_node) if index.zero?

    current = @head
    (index - 1).times { current = current.next_node }
    insert_node.next_node = current.next_node
    current.next_node = insert_node
  end

  def remove_at(index)
    return puts 'Invalid index number' if size < index

    current = @head
    return @head = @head.next_node if index.zero?

    (index - 1).times { current = current.next_node }
    current.next_node = current.next_node.next_node
    self
  end
end

# Create node class
class Node
  attr_accessor :next_node, :value

  def initialize(value, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

list = LinkedList.new()
5.times { list.append(Node.new(rand(2..20)))}
puts list 
list.insert_at(4,0)
puts list
puts list.to_s
puts list.head.to_s
p list.contains?(4)
p list.find_recursive(5)
p list.size
