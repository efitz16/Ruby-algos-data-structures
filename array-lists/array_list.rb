require_relative "../out_of_bounds_exception"

class ArrayList
  attr_reader :array

  def initialize(size)
    @array = Array.new(size)
  end

  def add(element)
    self.array = Array.new(self.array.length + 1)

    self.array[self.array.length - 1] = element

    return element
  end

  def get(index)
    check_bounds(index)

    self.array[index]
  end

  def set(index, element)
    check_bounds(index)

    self.array[index] = element
  end

  def length
  	self.array.size
  end

  private
  attr_writer :array

  def check_bounds(index)
    raise OutOfBoundsException, "Out of bounds" if index > self.array.size
  end

end