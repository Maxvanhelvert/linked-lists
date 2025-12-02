require './linked-list'

list = LinkedList.new

#  list.append('dog')
#  list.append('cat')
#  list.append('parrot')
#  list.append('hamster')
#  list.append('snake')
#  list.append('turtle')

p list.head
p list.tail
p list.to_s
list.insert_at('chicken', 3)
p list.to_s
puts list.remove_at(3)
p list.to_s
p list.size
