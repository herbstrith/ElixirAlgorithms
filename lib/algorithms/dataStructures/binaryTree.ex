defmodule Algorithms.DataStructures.BinaryTree do
  alias Algorithms.DataStructures.BinaryTree, as: TreeNode
  defstruct key: nil, parent: nil, left: nil, right: nil, data: nil

  def insert(actual_tree_node = %TreeNode{left: nil, right: nil}, new_node = %TreeNode{}) do
    new_node = %TreeNode{new_node | parent: actual_tree_node.key}

    if actual_tree_node.key < new_node.key do
      %TreeNode{actual_tree_node | right: new_node}
    else
      %TreeNode{actual_tree_node | left: new_node}
    end
  end

  def insert(actual_tree_node = %TreeNode{right: nil}, new_node = %TreeNode{}) do
    if actual_tree_node.key < new_node.key do
      new_node = %TreeNode{new_node | parent: actual_tree_node.key}
      %TreeNode{actual_tree_node | right: new_node}
    else
      %TreeNode{actual_tree_node | left: insert(actual_tree_node.left, new_node)}
    end
  end

  def insert(actual_tree_node = %TreeNode{left: nil}, new_node = %TreeNode{}) do
    if actual_tree_node.key < new_node.key do
      %TreeNode{actual_tree_node | right: insert(actual_tree_node.right, new_node)}
    else
      new_node = %TreeNode{new_node | parent: actual_tree_node.key}
      %TreeNode{actual_tree_node | left: new_node}
    end
  end

  def insert(actual_tree_node = %TreeNode{}, new_node = %TreeNode{}) do
    if actual_tree_node.key < new_node.key do
      %TreeNode{actual_tree_node | right: insert(actual_tree_node.right, new_node)}
    else
      new_node = %TreeNode{new_node | parent: actual_tree_node}
      %TreeNode{actual_tree_node | left: insert(actual_tree_node.left, new_node)}
    end
  end

  def search(_tree_node, _key = nil) do
    nil
  end

  def search(_tree_node = nil, _key) do
    nil
  end

  def search(tree_node = %TreeNode{}, key) do
    if tree_node.key == key do
      tree_node
    else
      if tree_node.key > key do
        search(tree_node.left, key)
      else
        search(tree_node.right, key)
      end
    end
  end

  def minimum(tree_node = %TreeNode{left: nil}) do
    tree_node
  end

  def minimum(tree_node = %TreeNode{}) do
    minimum(tree_node.left)
  end

  def maximum(tree_node = %TreeNode{right: nil}) do
    tree_node
  end

  def maximum(tree_node = %TreeNode{}) do
    maximum(tree_node.right)
  end

  def successor(binary_tree, tree_node = %TreeNode{}) do
    if tree_node.right != nil do
      minimum(tree_node.right)
    else
      parent = search(binary_tree, tree_node.parent)
      successor(binary_tree, parent, tree_node)
    end
  end

  defp successor(_binary_tree, tree_node = %TreeNode{parent: nil}, _searchNode) do
    tree_node
  end

  defp successor(binary_tree, tree_node = %TreeNode{}, searchNode = %TreeNode{}) do
    if tree_node.left.key == searchNode.key do
      tree_node
    else
      parent = search(binary_tree, tree_node.parent)
      successor(parent, searchNode)
    end
  end

  def delete(actual_node = nil, _delete_node = %TreeNode{}) do
    actual_node
  end

  def delete(actual_node = %TreeNode{}, delete_node = %TreeNode{}) do
    cond do
      # in case we are deleting the root
      delete_node.key == actual_node.key ->
        transplant(nil, delete_node)

      actual_node.right != nil && delete_node.key == actual_node.right.key ->
        transplant_right(actual_node, delete_node)

      actual_node.left != nil && delete_node.key == actual_node.left.key ->
        transplant_left(actual_node, delete_node)

      delete_node.key > actual_node.key ->
        %TreeNode{actual_node | right: delete(actual_node.right, delete_node)}

      delete_node.key < actual_node.key ->
        %TreeNode{actual_node | left: delete(actual_node.left, delete_node)}
    end
  end

  defp transplant_right(parent_node, delete_node) do
    cond do
      delete_node.right == nil ->
        %TreeNode{parent_node | right: delete_node.left}

      delete_node.left == nil ->
        %TreeNode{parent_node | right: delete_node.right}

      true ->
        transplant(parent_node, delete_node)
    end
  end

  defp transplant_left(parent_node, delete_node) do
    cond do
      delete_node.right == nil ->
        %TreeNode{parent_node | left: delete_node.left}

      delete_node.left == nil ->
        %TreeNode{parent_node | left: delete_node.right}

      true ->
        transplant(parent_node, delete_node)
    end
  end

  # transplanting the root
  defp transplant(_parent_node = nil, delete_node) do
    minimumNode = minimum(delete_node.right)
    treeWithoutMinimum = remove_leaf(delete_node.right, minimumNode)
    %TreeNode{minimumNode | parent: nil, right: treeWithoutMinimum, left: delete_node.left}
  end

  defp transplant(parent_node, delete_node) do
    minimumNode = minimum(delete_node.right)
    treeWithoutMinimum = remove_leaf(delete_node.right, minimumNode)

    transplantTree = %TreeNode{
      minimumNode
      | parent: parent_node.key,
        right: treeWithoutMinimum,
        left: delete_node.left
    }

    %TreeNode{parent_node | left: transplantTree}
  end

  defp remove_leaf(actual_node = %TreeNode{}, leaf_node = %TreeNode{}) do
    cond do
      actual_node.key == leaf_node.key ->
        nil

      actual_node.left.key == leaf_node.key ->
        %TreeNode{actual_node | left: nil}

      actual_node.right.key == leaf_node.key ->
        %TreeNode{actual_node | right: nil}

      actual_node.key < leaf_node.key ->
        %TreeNode{actual_node | right: remove_leaf(actual_node.right, leaf_node)}

      actual_node.key > leaf_node.key ->
        %TreeNode{actual_node | left: remove_leaf(actual_node.left, leaf_node)}
    end
  end
end
