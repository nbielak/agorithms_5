# There are many ways to implement these methods, feel free to add arguments 
# to methods as you see fit, or to create helper methods.
require_relative 'bst_node'

class BinarySearchTree
  attr_accessor :root
  def initialize
    @root = nil
  end

  def insert(value)
    new_node = BSTNode.new(value)
    if @root.nil?
      @root = new_node
    else
      parent = find_parent(value)

      if value > parent.value
        parent.right = new_node
      else
        parent.left = new_node
      end
    end

    new_node
  end

  def find(value, tree_node = @root)
    return nil if tree_node.nil?
    return tree_node if tree_node.value == value
  
    if value <= tree_node.value
      return find(value, tree_node.left)
    else
      return find(value, tree_node.right)
    end
  end

  def delete(value)
    # node = find(value)
    # parent = find_parent(value)

    # if no_children?(node)
    #   value > parent.value ? parent.right = nil : parent.left = nil
    # elsif one_child?(node)
    #   node.left.nil? ? new_node = node.right : new_node = node.left
    #   new_node.value > parent.value ? parent.right = new_node : parent.left = nil
    # else
    #   new_node = maximum(node)
    # end
    
    # node
  end

  # helper method for #delete:
  def maximum(tree_node = @root)
    return tree_node if tree_node.right.nil?
    maximum(tree_node.right)
  end

  def depth(tree_node = @root)
    return 0 if tree_node.nil? || no_children?(tree_node)

    tree_node.left ? left_depth = depth(tree_node.left) : left_depth = 0
    tree_node.right ? right_depth = depth(tree_node.right) : right_depth = 0

    [left_depth, right_depth].max + 1
  end 

  def is_balanced?(tree_node = @root)
    return true if tree_node.nil?
    left, right = depth(tree_node.left), depth(tree_node.right)

    ((left - right).abs <= 1) && is_balanced?(tree_node.left) && is_balanced?(tree_node.right)
  end

  def in_order_traversal(tree_node = @root, arr = [])
    return arr if tree_node.nil?
    return [tree_node.value] if no_children?(tree_node)

    left_arr = in_order_traversal(tree_node.left)
    right_arr = in_order_traversal(tree_node.right)

    left_arr + [tree_node.value] + right_arr
  end


  private
  # optional helper methods go here:

  def find_parent(value, tree_node = @root)
    return tree_node if tree_node.left.nil? && value <= tree_node.value
    return tree_node if tree_node.right.nil? && value > tree_node.value
    node = nil 
    if value > tree_node.value
      node = find_parent(value, tree_node.right)
    else
      node = find_parent(value, tree_node.left)
    end

    node
  end

  def no_children?(node)
    node.left.nil? && node.right.nil?
  end

  def one_child?(node)
    (node.left.nil? && !!node.right) || (node.right.nil? && !!node.left)
  end

end