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
    else
      @tail.next = temp_node
      @tail = temp_node
      @@node_counter += 1
    end
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

  def head
    return nil if @head.nil?
    output = []
    output << @head.value << @head.next.value
  end

  def tail
    return nil if @tail.nil?
    output = []
    output << @tail.value << nil
  end

  def insert_at(index, value)
    return 'OUT OF INDEX RANGE' if index > size || index < 0
    return prepend(value) if index == 0
    return append(value) if index == size
    index_counter = 0
    temp_node = @head
    new_node = Node.new(value)
    #traverse to find the specified index
    while index_counter < index - 1
      temp_node = temp_node.next
      index_counter += 1
    end
    new_node.next = temp_node.next
    temp_node.next = new_node
    @@node_counter += 1
  end

  def remove_at(index)
    return "NO MORE ITEMS TO DELETE" if size == 0
    return "OUT OF INDEX RANGE" if index > size - 1
    return pop if index == size - 1
    if index == 0
      @head = @head.next
      @@node_counter -= 1
      return size
    end
    index_counter = 0
    temp_node = @head
    while index_counter < index - 1
      temp_node = temp_node.next
      index_counter += 1
    end
    temp_node.next = temp_node.next.next
    @@node_counter -= 1
  end

  def at(index)
    return head if index == 0
    return tail if index == -1 || index + 1 == size
    return [nil,nil] if index + 1 > size
    node_output = []
    index_counter = 0
    temp_node = @head
    while index_counter < index
      temp_node = temp_node.next
      index_counter += 1
    end
      node_output << temp_node.value << temp_node.next.value
  end

  def to_s
    temp_node = @head
    while temp_node != nil
      print "(  #{temp_node.value}  ) -> "
      temp_node = temp_node.next
    end
    print 'nil'
  end

  def contains?(value)
    temp_node = @head
    while temp_node != nil
      return true if temp_node.value == value
      temp_node = temp_node.next
    end
    return false
  end

  def find(value)
    temp_node = @head
    index_counter = 0
    while temp_node != nil
      return index_counter if temp_node.value == value
      temp_node = temp_node.next
      index_counter += 1
    end
  end

  def pop
    if size <= 1
      @head = nil
      @tail = nil
      @@node_counter = 0
    end
    temp_node = @head
    while temp_node != nil
      if temp_node.next.next.nil?
        temp_node.next = nil
        @tail = temp_node
        @@node_counter -= 1
      end
      temp_node = temp_node.next
    end
    size
  end

  def size
    @@node_counter
  end
end

mylist = LinkedList.new

# 99.times { mylist.append((1..5000).to_a.sample) }