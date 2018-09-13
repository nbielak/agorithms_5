# There are many ways to implement these methods, feel free to add arguments 
# to methods as you see fit, or to create helper methods.

class BinarySearchTree
  attr_accessor :root
  def initialize
    @root = nil
  end

  def insert(value)
    root = value if @root = nil


  end

  def find(value, tree_node = @root)
    return tree_node if tree_node.value == value 

    if value < tree_node.value && (tree_node.left || tree_node.right)
      return find(value, tree_node.left)
    else 
      return find(value, tree_node.right)
    end
    nil
  end

  def delete(value)
  end

  # helper method for #delete:
  def maximum(tree_node = @root)
  end

  def depth(tree_node = @root)
  end 

  def is_balanced?(tree_node = @root)
  end

  def in_order_traversal(tree_node = @root, arr = [])
    return [tree_node] if tree_node.left.nil? && tree_node.right.nil?

    left = tree_node.left.nil? ? [] : in_order_traversal(tree_node.left)
    right = tree_node.right.nil? ? [] : in_order_traversal(tree_node.right)

    left + [tree_node] + right
    
  end


  private
  # optional helper methods go here:

  # def node_finder(val, )

end
