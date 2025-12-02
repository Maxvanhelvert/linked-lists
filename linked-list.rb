require './node'

class LinkedList
  attr_accessor :name

  def initialize
    @head = Node.new(nil)
    @tail = Node.new(nil)
  end

  def prepend(value)
    if @head.nil?
      @head = value
      @tail = value
    else 
      value.next_node = @head
      @head = value
    end
  end

  def append(value)
    value = Node.new(value)
    if @head.nil?
      @head = value
      @tail = value
    else 
      @tail.next_node = value
      @tail = value
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
end
