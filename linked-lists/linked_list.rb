require_relative "node.rb"

class LinkedList
  attr_reader :first, :last

  def initialize
  	@first = nil
  	@last = nil
  end

  def insert_first(element)
  	if self.first == nil
  	  self.first = element
      self.last = element
  	else
  	  element.insert_after(self.first)
  	  self.first = element
  	end
  end

  def remove_first
    if self.first != nil
      self.last = nil if self.first.next == nil
  	  self.first = self.first.next
    end
  end

  def insert_last(element)
  	if self.last == nil
  	  self.last = element
      self.first = element
  	else
  	  self.last.insert_after(element) 
  	  self.last = element
    end
  end

  def remove_last
  	if self.last != nil

      if self.first == self.last
        self.first = nil
        self.last = nil
      else
        ptr = self.first

        until ptr.next == self.last
          ptr = ptr.next
        end

        self.last = ptr
        self.last.remove_after
      end
  	end
  end

  def get(index)
    pointer = first
    count = 0

    until count == index
      pointer = pointer.next
      count += 1
    end

    pointer
  end

  def set(index, element)
    pointer = first
    count = 0

    until count == index
      pointer = pointer.next
      count += 1
    end

    pointer.element = element
  end

  def insert(index, element)
    new_node = Node.new(element)

    if index == 0
      new_node.insert_after(self.first)
      self.first = new_node
    else
      pointer = first
      count = 0
  
      until count == index - 1
        pointer = pointer.next
        count += 1
      end

      # if pointer.next == last
        
      # else
        new_node.insert_after(pointer.next)
      # end

      pointer.insert_after(new_node)
    end
  end

  def size
    count = 0
    if first != nil
      ptr = first
      count = 1

      until ptr == self.last do
        ptr = ptr.next
        count += 1
      end
    end

    count
  end

  private
  attr_writer :first, :last
end

# list = LinkedList.new
# node1 = Node.new("a")
# node2 = Node.new("b")
# node3 = Node.new("c")

#         list.insert_last(node2)
#       list.insert_last(node3)
#       list.insert_last(node1)
