defmodule Algorithms.DataStructures.BinaryTree do
  alias Algorithms.DataStructures.BinaryTree, as: TreeNode
  defstruct key: nil, parent: nil, left: nil, right: nil, data: nil
  def insert(actualTreeNode = %TreeNode{left: nil, right: nil}, newNode = %TreeNode{}) do
    newNode = %TreeNode{newNode | parent: actualTreeNode.key}
    if (actualTreeNode.key < newNode.key) do
      %TreeNode{ actualTreeNode |
        right: newNode,
      }
    else
      %TreeNode{ actualTreeNode |
        left: newNode,
      }
    end
  end
  def insert(actualTreeNode = %TreeNode{right: nil}, newNode = %TreeNode{}) do
    if (actualTreeNode.key < newNode.key) do
      newNode = %TreeNode{newNode | parent: actualTreeNode.key}
      %TreeNode{ actualTreeNode |
        right: newNode,
      }
    else
      %TreeNode{ actualTreeNode |
        left: insert(actualTreeNode.left, newNode),
      }
    end
  end

  def insert(actualTreeNode = %TreeNode{left: nil}, newNode = %TreeNode{}) do
    if (actualTreeNode.key < newNode.key) do
      %TreeNode{ actualTreeNode |
        right: insert(actualTreeNode.right, newNode),
      }
    else
      newNode = %TreeNode{newNode | parent: actualTreeNode.key}
      %TreeNode{ actualTreeNode |
        left: newNode,
      }
    end
  end

  def insert(actualTreeNode = %TreeNode{}, newNode = %TreeNode{}) do
    if (actualTreeNode.key < newNode.key) do
      %TreeNode{ actualTreeNode |
        right: insert(actualTreeNode.right, newNode),
      }
    else
      newNode = %TreeNode{newNode | parent: actualTreeNode}
      %TreeNode{ actualTreeNode |
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

  def delete(actualNode = nil, _deleteNode = %TreeNode{}) do
    actualNode
  end

  def delete(actualNode = %TreeNode{}, deleteNode = %TreeNode{}) do
    cond do
      # in case we are deleting the root
      deleteNode.key == actualNode.key ->
        transplant(nil, deleteNode)
      actualNode.right != nil && deleteNode.key == actualNode.right.key ->
        transplantRight(actualNode, deleteNode)
      actualNode.left != nil && deleteNode.key == actualNode.left.key ->
        transplantLeft(actualNode, deleteNode)
      deleteNode.key > actualNode.key ->
        %TreeNode{ actualNode |
          right: delete(actualNode.right, deleteNode),
        }
      deleteNode.key < actualNode.key ->
        %TreeNode{ actualNode |
          left: delete(actualNode.left, deleteNode),
        }
    end
  end

  defp transplantRight(parentNode, deleteNode) do
    cond do
      deleteNode.right == nil ->
        %TreeNode{ parentNode | right: deleteNode.left }
      deleteNode.left == nil ->
        %TreeNode{ parentNode | right: deleteNode.right }
      true ->
        transplant(parentNode, deleteNode)
    end
  end

  defp transplantLeft(parentNode, deleteNode) do
    cond do
      deleteNode.right == nil ->
        %TreeNode{ parentNode | left: deleteNode.left }
      deleteNode.left == nil ->
        %TreeNode{ parentNode | left: deleteNode.right }
      true ->
      transplant(parentNode, deleteNode)
    end
  end

  #transplanting the root
  defp transplant(_parentNode = nil, deleteNode) do
    minimumNode = minimum(deleteNode.right)
    treeWithoutMinimum = removeLeaf(deleteNode.right, minimumNode)
    %TreeNode{minimumNode | parent: nil, right: treeWithoutMinimum, left: deleteNode.left }
  end

  defp transplant(parentNode, deleteNode) do
    minimumNode = minimum(deleteNode.right)
    treeWithoutMinimum = removeLeaf(deleteNode.right, minimumNode)
    transplantTree = %TreeNode{minimumNode | parent: parentNode.key, right: treeWithoutMinimum, left: deleteNode.left }
    %TreeNode{ parentNode | left: transplantTree }
  end

  defp removeLeaf(actualNode = %TreeNode{}, leafNode = %TreeNode{}) do
    cond do
      actualNode.key == leafNode.key ->
        nil
      actualNode.left.key == leafNode.key ->
        %TreeNode{ actualNode | left: nil }
      actualNode.right.key == leafNode.key ->
        %TreeNode{ actualNode | right: nil }
      actualNode.key < leafNode.key ->
        %TreeNode{actualNode | right: removeLeaf(actualNode.right, leafNode)}
      actualNode.key > leafNode.key ->
        %TreeNode{actualNode | left: removeLeaf(actualNode.left, leafNode)}
    end
  end
end
