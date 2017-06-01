require_relative "node.rb"
require_relative "../fixed-arrays/out_of_bounds_exception.rb"

class LinkedList
  attr_reader :first, :last

  def initialize
  	@first = nil
  	@last = nil
  end

  def insert_first(element)
    node = Node.new(element)
  	if self.first == nil
  	  self.first = node
      self.last = node
  	else
  	  node.insert_after(self.first)
  	  self.first = node
  	end
  end

  def remove_first
    if self.first != nil
      self.last = nil if self.first.next == nil
  	  self.first = self.first.next
    end
  end

  def insert_last(element)
    node = Node.new(element)
  	if self.last == nil
  	  self.last = node
      self.first = node
  	else
  	  self.last.insert_after(node) 
  	  self.last = node
    end
  end

  def remove_last
  	if self.last != nil

      if self.first == self.last
        # item = self.last
        self.first = nil
        self.last = nil
        # item
      else
        ptr = self.first

        until ptr.next == self.last
          ptr = ptr.next
        end

        # item = self.last

        self.last = ptr
        self.last.remove_after

        # item
      end
  	end
  end

  def get(index)
    raise OutOfBoundsException, "Out of bounds" if index >= self.size
    
    pointer = first
    count = 0

    until count == index
      pointer = pointer.next
      count += 1
    end

    pointer
  end

  def set(index, element)
    raise OutOfBoundsException, "Out of bounds" if index >= self.size

    pointer = first
    count = 0

    until count == index
      pointer = pointer.next
      count += 1
    end

    pointer.element = element
  end

  def insert(index, element)
    raise OutOfBoundsException, "Out of bounds" if index > self.size

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

      new_node.insert_after(pointer.next)

      pointer.insert_after(new_node)

      self.last = new_node if index == self.size
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
