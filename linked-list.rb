require './node'

class LinkedList
  attr_accessor :name

  def initialize
    @head = Node.new
    @tail = Node.new
  end

  def prepend(value)
    node = Node.new
    node.value = value
    if @head.nil?
      @head = node
      @tail = node
    else 
      node.next_node = @head
      @head = node
    end
  end

  def append(value)
    node = Node.new
    node.value = value
    if @head.value.nil?
      @head = node
      @tail = node
    else 
      @tail.next_node = node
      @tail = node
    end
  end

  def size
    count = 0
    current = @head

    while !current.nil?
      count += 1
      current = current.next_node
    end

    count
  end

  def head
    @head.value
  end

  def tail
    @tail.value
  end

  def at(index)
    count = 0
    current = @head

    while count < index
      count += 1
      current = current.next_node
    end

    current.value
  end

  def pop
    nil if @head.nil?
    
    prev2 = @head
    prev = prev2.next_node
    current = prev.next_node

    while !current.nil?
      prev2 = prev
      prev = current
      current = current.next_node
    end

    data = prev.value
    prev2.next_node = nil
    @tail = prev2
    data
  end

  def to_s
    string = ''
    current = @head

    while !current.nil?
      string << "( #{current.value} ) -> "
      current = current.next_node
    end

    string << "nil"

    string
  end
end
