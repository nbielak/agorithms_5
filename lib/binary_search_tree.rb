# There are many ways to implement these methods, feel free to add arguments 
# to methods as you see fit, or to create helper methods.
require_relative 'bst_node'

class BinarySearchTree
  attr_accessor :root
  def initialize
    @root = nil
  end

  def insert(value)
    if @root.nil?
      @root = BSTNode.new(value) 
    else
      insert_helper(value, @root)
    end
  end

  def find(value, tree_node = @root)
    return nil if tree_node.nil?
    return tree_node if tree_node.value == value

    if value > tree_node.value
      return find(value, tree_node.right)
    else
      return find(value, tree_node.left)
    end
  end

  def delete(value)
    parent = find_parent(value)
    
  end

  # helper method for #delete:
  def maximum(tree_node = @root)
    return tree_node if tree_node.left.nil? && tree_node.right.nil?

    tree_node.right ? maximum(tree_node.right) : maximum(tree_node.left)
  end

  def depth(tree_node = @root)
  end 

  def is_balanced?(tree_node = @root)
  end

  def in_order_traversal(tree_node = @root, arr = [])
  end


  private
  # optional helper methods go here:

  def insert_helper(value, tree_node)
    return BSTNode.new(value) if tree_node.nil?
    if value > tree_node.value
      tree_node.right = insert_helper(value, tree_node.right)
    else
      tree_node.left = insert_helper(value, tree_node.left)
    end
    tree_node
  end

  def find_parent(value, tree_node = @root)
    return nil if tree_node.left.nil? && tree_node.right.nil?
    return tree_node if (tree_node.left == value || tree_node.right == value)

    if value > tree_node.value
      return find_parent(value, tree_node.right)
    else
      return find_parent(value, tree_node.left)
    end
  end
  
end


# if tree_node.nil?
    #   tree_node = BSTNode.new(value) 
    # else
    #   if value > tree_node.value
    #     if tree_node.right.nil?
    #       return tree_node.right = BSTNode.new(value)
    #     else
    #       insert_helper(value, tree_node.right)
    #     end
    #   else
    #     if tree_node.left.nil?
    #       return tree_node.left = BSTNode.new(value)
    #     else
    #       insert_helper(value, tree_node.left)
    #     end
    #   end
    # end