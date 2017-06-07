require_relative 'tree_node.rb'

class Tree
  attr_reader :root

  def initialize(node)
    return if node.class != TreeNode
    @root = node
  end

  def search(&value)
  	ptr1 = @root
    ptr2 = @root
    # ptr1 = @root.children.get(0)
    # ptr2 = @root.children.get(1)

    while ptr1.value != value || ptr2.value != value

  end


end