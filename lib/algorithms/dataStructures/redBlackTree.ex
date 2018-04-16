defmodule Algorithms.DataStructures.RedBlackTree do
 @moduledoc """
    A red-black tree is approximately balanced
    A red-black tree is a binary tree that satisfies the following red-black properties:
    1. Every node is either red or black.
    2. The root is black.
    3. Every leaf (NIL) is black.
    4. If a node is red, then both its children are black.
    5. For each node, all simple paths from the node to descendant leaves contain the
      same number of black nodes.

    Using the implementantion of insertion found in the article
    "Red-black trees in a functional setting" by Chris Okasaki
  """
  alias Algorithms.DataStructures.RedBlackTree, as: RBNode
  defstruct key: nil, left: nil, right: nil, data: nil, color: :black

  def create() do
    %RBNode{}
  end

  # haskel equivalent: balance B (T R (T R a x b) y c) z d = T R (T B a x b) y (T B c z d)
  def balance(_nodeColor = :black, leftNode = %RBNode{color: :red, left: %RBNode{color: :red}}, x, rightNode) do
    %RBNode{
      color: :red,
      left: %RBNode{
        color: :black,
        key: leftNode.left.key,
        data: leftNode.left.data,
        left: leftNode.left.left,
        right: leftNode.left.right,
      },
      key: leftNode.key,
      data: leftNode.data,
      right: %RBNode{
        color: :black,
        key: x.key,
        data: x.data,
        left: leftNode.right,
        right: rightNode,
      },
    }
  end

  # haskel equivalent: balance B (T R a x (T R b y c)) z d = T R (T B a x b) y (T B c z d)
  def balance(_nodeColor = :black, leftNode = %RBNode{color: :red, right: %RBNode{color: :red}}, x, rightNode) do
    %RBNode{
      color: :red,
      left: %RBNode{
        color: :black,
        key: leftNode.key,
        data: leftNode.data,
        left: leftNode.left,
        right: leftNode.right.left,
      },
      key: leftNode.right.key,
      data: leftNode.right.data,
      right: %RBNode{
        color: :black,
        key: x.key,
        data: x.data,
        left: leftNode.right.right,
        right: rightNode,
      },
    }
  end

  # haskel equivalent: balance B a x (T R (T R b y c) z d) = T R (T B a x b) y (T B c z d)
  def balance(_nodeColor = :black, leftNode, x, rightNode = %RBNode{color: :red, left: %RBNode{color: :red}}) do
    %RBNode{
      color: :red,
      left: %RBNode{
        color: :black,
        key: x.key,
        data: x.data,
        left: leftNode,
        right: rightNode.left.left,
      },
      key: rightNode.left.key,
      data: rightNode.left.data,
      right: %RBNode{
        color: :black,
        key: rightNode.key,
        data: rightNode.data,
        left: rightNode.left.right,
        right: rightNode.right,
      },
    }
  end


  #haskel original: balance B a x (T R b y (T R c z d)) = T R (T B a x b) y (T B c z d)
  def balance(_nodeColor = :black, leftNode, x, rightNode = %RBNode{color: :red, right: %RBNode{color: :red}}) do
    %RBNode{
      color: :red,
      left: %RBNode{
        color: :black,
        key: x.key,
        data: x.data,
        left: leftNode,
        right: rightNode.left,
      },
      key: rightNode.key,
      data: rightNode.data,
      right: %RBNode{
        color: :black,
        key: rightNode.right.key,
        data: rightNode.right.data,
        left: rightNode.right.left,
        right: rightNode.right.right,
      },
    }
  end

  def balance(nodeColor, leftNode, x, rightNode) do
    %RBNode{
      color: nodeColor,
      left: leftNode,
      key: x.key,
      data: x.data,
      right: rightNode
    }
  end

  def insert(actualTreeNode = %RBNode{}, newNode = %RBNode{}) do
    %RBNode{insertRec(actualTreeNode, newNode) | color: :black}
  end

  def insertRec(_actualTreeNode = nil, newNode = %RBNode{}) do
    %{newNode | color: :red}
  end

  def insertRec(actualTreeNode = %RBNode{}, newNode = %RBNode{}) do
    cond do
      actualTreeNode.key > newNode.key -> 
        balance(actualTreeNode.color, insertRec(actualTreeNode.left, newNode), actualTreeNode, actualTreeNode.right)
      actualTreeNode.key == newNode.key -> 
        actualTreeNode
      actualTreeNode.key < newNode.key -> 
        balance(actualTreeNode.color, actualTreeNode.left, actualTreeNode, insertRec(actualTreeNode.right, newNode))
    end
  end

end