class LinkedList
#change starting index number to 0 instead of one
  def initialize
    @head = nil
    @tail = nil
  end

  def append(node)
    if @head == nil
      #nodes assigned to head and tail. 
      @head = node
      @tail = node
    else
      # @tail is the previous node
      @tail.next_node = node
      @tail = node
    end
  end

  def prepend(node)
    if @head == nil
      @head = node
      @tail = node
    else
      node.next_node = @head
      @head = node
    end
  end

  def size
    current = @head
    return 0 if current == nil

    size = 1
    while !current.next_node.nil?
      size += 1
      current = current.next_node
    end
    size
  end
# needa work
  def head
    @head
  end

  def tail 
    @tail
  end

  def at(index)
    current = @head
    return 'Empty List' if current.nil?
    # since current is already at head i.e. index 0
    index.times { current = current.next_node }
    current
  end

  def pop
    # set the second last node's value to nil, and @tail to second_last node
    current = @head
    (self.size - 2).times { current = current.next_node }
    @tail = current
    current.next_node = nil
  end

  def contains_recursive(value, current = @head)
    return false if current.nil?
    return true if current.value == value

    contains_recursive(value, current.next_node)
  end

  def contains?(value)
    @head.value == value ? (return true) : current = @head
    while !current.next_node.nil?
      current = current.next_node
      return true if current.value == value
    end
    false
  end

  def find(value) 
    # returns index of found value
    index = 0
    return index if @head.value == value

    current = @head
    while !current.next_node.nil?
      index += 1
      current = current.next_node
      return index if current.value == value
    end
    nil
  end

  def to_s
    return nil if @head.nil? 

    current = @head
    output = "#{current.value}" # TODO check how not to overwrite methods to use to_s

    while !current.next_node.nil?
      current = current.next_node
      output << " -> #{current.value}"
    end

    output << ' -> nil'
  end

  def insert_at(value, index)
    return puts 'Invalid index number' if index > self.size

    insert_node = Node.new(value)
    return self.prepend(insert_node) if index.zero?

    current = @head
    (index - 1).times { current = current.next_node }
    insert_node.next_node = current.next_node
    current.next_node = insert_node
  end

  def remove_at(index)
    return puts 'Invalid index number' if self.size < index

    current = @head
    return @head = @head.next_node if index.zero?

    (index - 1).times { current = current.next_node }
    current.next_node = current.next_node.next_node
    self
  end
end

class Node
  attr_accessor :next_node, :value

  def initialize(value, next_node = nil)
    @value = value
    @next_node = next_node
  end
end
