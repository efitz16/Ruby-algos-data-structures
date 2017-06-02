require_relative '../fixed-arrays/fixed_array.rb'

class TreeNode
  attr_reader :value, :children

  def initialize(value)
  	@value = value
  	@children = FixedArray.new(2)
  end

  def add_child(child)
  	return if child.class != TreeNode

  	count = 0

  	while count < 2 do
  	 if children.get(count) == nil
       children.set(count, child)
       return
  	 end
  	 count += 1
  	end
  end

  private
  attr_writer :children
end