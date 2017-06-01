require_relative '../linked-lists/linked_list.rb'
require 'pry'

class Stack
  attr_reader :stack

  def initialize
  	@stack = LinkedList.new
  end

  def push(element)
  	self.stack.insert_first(element)
  end

  def pop
  	removed = self.top
  	self.stack.remove_first
  	removed
  end

  def top
  	self.stack.first
  end

  def empty?
  	return true if self.stack.size == 0
  end

  private
  attr_writer :stack
end