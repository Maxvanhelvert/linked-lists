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
end
