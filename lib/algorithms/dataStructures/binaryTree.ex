# defmodule Algorithms.DataStructures.TreeNode do
#   defstruct key: 0, parent: nil, left: nil, right: nil, data: 0
# end

defmodule Algorithms.DataStructures.BinaryTree do
  alias Algorithms.DataStructures.BinaryTree, as: TreeNode
  defstruct key: nil, parent: nil, left: nil, right: nil, data: nil

  def insert(actualTreeNode = %TreeNode{left: nil, right: nil}, newNode = %TreeNode{}) do
    newNode = %TreeNode{newNode | parent: actualTreeNode.key}
    if (actualTreeNode.key < newNode.key) do
      %TreeNode{
        key: actualTreeNode.key,
        left: actualTreeNode.left,
        parent: actualTreeNode.parent,
        data: actualTreeNode.data,
        right: newNode,
      }
    else
      %TreeNode{
        key: actualTreeNode.key,
        right: actualTreeNode.right,
        parent: actualTreeNode.parent,
        data: actualTreeNode.data,
        left: newNode,
      }
    end
  end

  def insert(actualTreeNode = %TreeNode{right: nil}, newNode = %TreeNode{}) do
    if (actualTreeNode.key < newNode.key) do
      newNode = %TreeNode{newNode | parent: actualTreeNode.key}
      %TreeNode{
        key: actualTreeNode.key,
        parent: actualTreeNode.parent,
        data: actualTreeNode.data,
        right: newNode,
        left: actualTreeNode.left,
      }
    else
      %TreeNode{
        key: actualTreeNode.key,
        parent: actualTreeNode.parent,
        data: actualTreeNode.data,
        right: actualTreeNode.right,
        left: insert(actualTreeNode.left, newNode),
      }
    end
  end

  def insert(actualTreeNode = %TreeNode{left: nil}, newNode = %TreeNode{}) do
    if (actualTreeNode.key < newNode.key) do
      %TreeNode{
        key: actualTreeNode.key,
        parent: actualTreeNode.parent,
        data: actualTreeNode.data,
        left: actualTreeNode.left,
        right: insert(actualTreeNode.right, newNode),
      }
    else
      newNode = %TreeNode{newNode | parent: actualTreeNode.key}
      %TreeNode{
        key: actualTreeNode.key,
        parent: actualTreeNode.parent,
        data: actualTreeNode.data,
        left: newNode,
        right: actualTreeNode.right,
      }
    end
  end

  def insert(actualTreeNode = %TreeNode{}, newNode = %TreeNode{}) do
    if (actualTreeNode.key < newNode.key) do
      %TreeNode{
        key: actualTreeNode.key,
        parent: actualTreeNode.parent,
        data: actualTreeNode.data,
        left: actualTreeNode.left,
        right: insert(actualTreeNode.right, newNode),
      }
    else
      newNode = %TreeNode{newNode | parent: actualTreeNode}
      %TreeNode{
        key: actualTreeNode.key,
        parent: actualTreeNode.parent,
        data: actualTreeNode.data,
        right: actualTreeNode.right,
        left: insert(actualTreeNode.left, newNode),
      }
    end
  end

  def search(_treeNode, _key = nil) do
    nil
  end

  def search(_treeNode = nil, _key) do
    nil
  end

  def search(treeNode = %TreeNode{}, key) do
    if (treeNode.key == key) do
      treeNode
    else
      if (treeNode.key > key) do
        search(treeNode.left, key)
      else
        search(treeNode.right, key)
      end
    end
  end

  def minimum(treeNode = %TreeNode{left: nil}) do
    treeNode
  end

  def minimum(treeNode = %TreeNode{}) do
    minimum(treeNode.left)
  end

  def maximum(treeNode = %TreeNode{right: nil}) do
    treeNode
  end

  def maximum(treeNode = %TreeNode{}) do
    maximum(treeNode.right)
  end

  def successor(binaryTree, treeNode = %TreeNode{}) do
    if (treeNode.right != nil) do
      minimum(treeNode.right)
    else
      parent = search(binaryTree, treeNode.parent)
      successor(binaryTree, parent, treeNode)
    end
  end

  defp successor(_binaryTree, treeNode = %TreeNode{parent: nil}, _searchNode) do
    treeNode
  end

  defp successor(binaryTree, treeNode = %TreeNode{}, searchNode = %TreeNode{}) do
    if (treeNode.left.key == searchNode.key) do
      treeNode
    else
      parent = search(binaryTree, treeNode.parent)
      successor(parent, searchNode)
    end
  end
end