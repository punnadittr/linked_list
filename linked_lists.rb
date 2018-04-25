class Node
  attr_accessor :next, :value
  def initialize(value)
    @value = value
    @next = nil
  end
end

class LinkedList
  def initialize
    @@node_counter = 0
    @head = nil
    @tail = nil
  end

  def append(value)
    temp_node = Node.new(value)
    if @tail.nil?
      @tail = temp_node
      @head = temp_node
      @@node_counter += 1
      @the_head = temp_node
    else
      @tail.next = temp_node
      @tail = temp_node
      @@node_counter += 1
    end
  end

  def head
    @the_head
  end

  def tail
    @tail
  end

  def prepend(value)
    temp_node = Node.new(value)
    if @head.nil?
      @head = temp_node
      @tail = temp_node
      @@node_counter += 1
    else
      temp_node.next = @head
      @head = temp_node
      @@node_counter += 1
    end
  end

  def size
    @@node_counter
  end

end

mylist = LinkedList.new
mylist.prepend(0)
mylist.append(1)
mylist.append(2)
mylist.append(3)
mylist.append(4)