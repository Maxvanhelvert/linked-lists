require './node'

class LinkedList
  attr_accessor :name

  def initialize
    @head = nil
    @tail = nil
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
    if @head.nil?
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
    return nil if @head.nil?
    @head.value
  end

  def tail
    return nil if @head.nil?
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
    return nil if @head.nil?
    if @head.next_node.nil?
      del_node = @head
      @head = nil
      @tail = nil
      del_node.value
    else
      current = @head

      while current.next_node != @tail 
        current = current.next_node
      end
      
      del_node = @tail
      current.next_node = nil
      @tail = current

      del_node.value
    end
  end

  def contains(value)
    current = @head

    while current
      return true if current == value
      current = current.next_node
    end

    false
  end

  def find(value)
    current = @head
    index = 0

    while current
      return index if current.value == value

      current = current.next_node
      index += 1
    end

    nil
  end

  def to_s
    return nil if @head.nil?
    string = ''
    current = @head

    while !current.nil?
      string << "( #{current.value} ) -> "
      current = current.next_node
    end

    string << "nil"

    string
  end

  def insert_at(value, index)
    return self.prepend(value) if index == 0 || @head.nil?
    return self.append(value) if index >= self.size

    current = @head
    count = 0

    while count < index - 1
      current = current.next_node
      count += 1
    end

    new_node = Node.new
    new_node.value = value
    
    new_node.next_node = current.next_node
    current.next_node = new_node

  end

  def remove_at(index)
    return nil if @head.nil? || @head.next_node.nil?
    return self.pop if index == self.size - 1
    return nil if index >= self.size

    if index == 0 
      del_node = @head
      @head = @head.next_node
      @tail = nil if @head.nil?
      return del_node.value
    end

    current = @head
    count = 0

    while count < index - 1
      current = current.next_node
      count += 1
    end
    
    del_node = current.next_node

    current.next_node = del_node.next_node

    del_node.value
  end
end
