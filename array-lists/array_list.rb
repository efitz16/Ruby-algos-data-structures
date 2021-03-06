require_relative "../fixed-arrays/fixed_array"

class ArrayList
  attr_reader :array_list

  def initialize(size)
    @array_list = FixedArray.new(size)
  end

  def length
    self.array_list.array.size
  end

  def add(element)
    self.array_list = FixedArray.new(self.length + 1)

    self.array_list.array[-1] = element

    element
  end

  def get(index)
    self.array_list.get(index)
  end

  def set(index, element)
    self.array_list.set(index, element)
  end

  def insert(index, element)
    new_arr = FixedArray.new(self.length + 1)

    for i in 0..index-1
      new_arr.set(i, self.array_list.get(i))
    end

    new_arr.set(index, element)

    for i in index+1..self.length
      new_arr.set(i, self.array_list.get(i-1))
    end

    self.array_list = new_arr
   end

  private
  attr_writer :array_list
end
