class Queue
  attr_reader :queue
  def initialize
  	@queue = LinkedList.new
  end

  def enqueue(element)
    queue.insert_last(element)
  end

  def dequeue
  	top = self.peel
    queue.remove_first
    top
  end

  def peel
  	self.queue.get(0)
  end

  def empty?
  	return true if self.queue.size == 0
  	false
  end

  private
  attr_writer :queue
end