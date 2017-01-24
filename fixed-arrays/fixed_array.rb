class OutOfBoundsException < StandardError
end

class FixedArray
	attr_reader :array

  def initialize(size)
  	@array = Array.new(size)
  end

  def get(index)
  	self.check_bounds(index)

  	self.array[index]
  end

  def set(index, element)
    self.check_bounds(index)

    self.array[index] = element
  end

  def check_bounds(index)
  	raise OutOfBoundsException, "Out of bounds" if index > self.array.size
  end
end
