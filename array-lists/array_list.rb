class ArrayList
  attr_reader :array

  def initialize(size)
    @array = Array.new(size)
  end

  def add(element)
    self.array = Array.new(self.array.size + 1)

    self.array[self.array.size - 1] = element

    return element
  end

  # def size
  # 	self.array.length
  # end

  private
  attr_writer :array
end