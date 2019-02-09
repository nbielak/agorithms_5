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
    if @root.left.nil? && @root.right.nil?
      @root = nil
    else
      delete_helper(@root, value)
    end
  end

  # helper method for #delete:
  def maximum(tree_node = @root)
    return tree_node if tree_node.right.nil?
    maximum(tree_node.right)
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

  def delete_helper(tree_node, value)
    return tree_node if tree_node.nil?

    if value > tree_node.value
      tree_node.right = delete_helper(tree_node.right, value)
    elsif value < tree_node.value
      tree_node.left = delete_helper(tree_node.left, value)
    else
      if tree_node.left.nil?
        temp = tree_node.right
        tree_node = nil 
        return temp
      elsif tree_node.right.nil?
        temp = tree_node.left
        tree_node = nil 
        return temp
      end

      temp = maximum(tree_node.left)
      tree_node.value = temp.value
      tree_node.left = delete_helper(tree_node.left, temp.value)
    end
    tree_node
  end
  
end
