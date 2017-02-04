require_relative "node.rb"

class LinkedList
  attr_reader :first, :last

  def initialize
  	@front = nil
  	@back = nil
  end

  def insert_first(element)
  	if self.first == nil
  	  self.first = element
  	else
  	  element.insert_after(self.first)
  	  self.first = element
  	end
  end

  def remove_first
    if self.first != nil
  	  self.first = self.first.next
      
    end
  end

  def insert_last(element)
  	if self.last == nil
  	  self.last = element
  	else
  	  self.last.insert_after(element) 
  	  self.last = element
  end

  def remove_last
  	if self.last != nil
       ptr = self.first

       until prt.next == self.last
         ptr = ptr.next
       end

       self.last = ptr
  	end
  end

  private
  attr_writer :first, :last
end
