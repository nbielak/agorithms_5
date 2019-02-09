
def kth_largest(tree_node, k)
    k_helper(tree_node)[k - 1]
    # k_helper(tree_node, k)
end

# def k_helper(tree_node, k, c=0)
#     return tree_node if tree_node.nil? || c >= k
#     right = k_helper(tree_node.right, k, c)
#     c += 1
#     if c == k
#         return tree_node
#     end
#     left = k_helper(tree_node.left, k, c)
# end

def k_helper(tree_node)
    return [tree_node.value] if tree_node.left.nil? && tree_node.right.nil?

    left = tree_node.left ? k_helper(tree_node.left) : []
    right = tree_node.right ? k_helper(tree_node.right) : []

    right + [tree_node] + left
end
