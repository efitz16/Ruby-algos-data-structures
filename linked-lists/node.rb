class Node
  attr_reader :next
  attr_accessor :element

  def initialize(element)
  	@element = element
  	@next = nil
  end

  def insert_after(other_node)
  	self.next = other_node
  end

  def remove_after
  	self.next = nil
  end

  private
  attr_writer :next
end
