require_relative '../linked-lists/linked_list.rb'
require 'pry'

class Stack
  attr_reader :stack

  def initialize
  	@stack = ArrayList.new(1)
  end

  def push(element)
  	self.stack.insert_first(element)
  end

  def pop
  	self.stack.remove_last
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