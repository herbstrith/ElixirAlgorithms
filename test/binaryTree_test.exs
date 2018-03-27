defmodule BinaryTreeTests do
  alias Algorithms.DataStructures.BinaryTree, as: BinaryTree
  use ExUnit.Case, async: true
  doctest Algorithms
  test "Should create a empty tree" do
    binaryTree = %BinaryTree{}
    assert binaryTree != nil
    assert binaryTree.key == nil
    assert binaryTree.data == nil
    assert binaryTree.left == nil
  end

  test "Should insert in a tree (new key should be on the left)" do
    newNode = %BinaryTree{key: 15, data: 15}
    binaryTree = %BinaryTree{key: 20, data: 20} |> BinaryTree.insert(newNode)
    assert binaryTree.key != nil
    assert binaryTree.data != nil
    assert binaryTree.right == nil
    assert binaryTree.left != nil
    assert binaryTree.left.key == 15
    assert binaryTree.left.data == 15
    assert binaryTree.left.parent == binaryTree.key
  end

  test "Should insert in a tree (new key should be on the right)" do
    newNode = %BinaryTree{key: 22, data: 22}
    binaryTree = %BinaryTree{key: 20, data: 20} |> BinaryTree.insert(newNode)
    assert binaryTree.key != nil
    assert binaryTree.data != nil
    assert binaryTree.left == nil
    assert binaryTree.right != nil
    assert binaryTree.right.key == 22
    assert binaryTree.right.data == 22
    assert binaryTree.right.parent == binaryTree.key
  end

  test "Should insert multiple times in a tree" do
    binaryTree = %BinaryTree{key: 20, data: 20} 
      |> BinaryTree.insert(%BinaryTree{key: 22, data: 22})
      |> BinaryTree.insert(%BinaryTree{key: 11, data: 11})
      |> BinaryTree.insert(%BinaryTree{key: 21, data: 21})
    assert binaryTree.key != nil
    assert binaryTree.data != nil
    assert binaryTree.right.key == 22
    assert binaryTree.right.data == 22
    assert binaryTree.right.parent == binaryTree.key
    assert binaryTree.left.key == 11
    assert binaryTree.left.data == 11
    assert binaryTree.left.parent == binaryTree.key
    assert binaryTree.right.left.key == 21
    assert binaryTree.right.left.data == 21
    assert binaryTree.right.left.parent == binaryTree.right.key
  end

  test "Should insert multiple times in a tree and then search" do
    binaryTree = %BinaryTree{key: 20, data: 20} 
      |> BinaryTree.insert(%BinaryTree{key: 22, data: 22})
      |> BinaryTree.insert(%BinaryTree{key: 11, data: 11})
      |> BinaryTree.insert(%BinaryTree{key: 21, data: 58})
    binaryNode = BinaryTree.search(binaryTree, 21)
    assert binaryNode.key == 21
    assert binaryNode.data == 58
    binaryNode = BinaryTree.search(binaryTree, 11)
    assert binaryNode.key == 11
    assert binaryNode.data == 11
    binaryNode = BinaryTree.search(binaryTree, 20)
    assert binaryNode.key == 20
    assert binaryNode.data == 20
    binaryNode = BinaryTree.search(binaryTree, 48)
    assert binaryNode == nil
  end

  test "Should get the minimum in a tree" do
    binaryTree = %BinaryTree{key: 20, data: 20} 
      |> BinaryTree.insert(%BinaryTree{key: 22, data: 22})
      |> BinaryTree.insert(%BinaryTree{key: 11, data: 11})
      |> BinaryTree.insert(%BinaryTree{key: 26, data: 26})
      |> BinaryTree.insert(%BinaryTree{key: 1, data: 1})
      |> BinaryTree.insert(%BinaryTree{key: 21, data: 58})
    binaryNode = BinaryTree.minimum(binaryTree)
    assert binaryNode.key == 1
    assert binaryNode.data == 1
  end

  test "Should get the minimum in a empty tree" do
    binaryTree = %BinaryTree{}
    binaryNode = BinaryTree.minimum(binaryTree)
    assert binaryNode.key == nil
  end

  test "Should get the maximum in a tree" do
    binaryTree = %BinaryTree{key: 20, data: 20} 
      |> BinaryTree.insert(%BinaryTree{key: 22, data: 22})
      |> BinaryTree.insert(%BinaryTree{key: 11, data: 11})
      |> BinaryTree.insert(%BinaryTree{key: 26, data: 26})
      |> BinaryTree.insert(%BinaryTree{key: 1, data: 1})
      |> BinaryTree.insert(%BinaryTree{key: 21, data: 58})
    binaryNode = BinaryTree.maximum(binaryTree)
    assert binaryNode.key == 26
    assert binaryNode.data == 26
  end

  test "Should get the maximum in a empty tree" do
    binaryTree = %BinaryTree{}
    binaryNode = BinaryTree.maximum(binaryTree)
    assert binaryNode.key == nil
  end

  test "Should get the successor in a tree" do
    binaryTree = %BinaryTree{key: 20, data: 20} 
      |> BinaryTree.insert(%BinaryTree{key: 22, data: 22})
      |> BinaryTree.insert(%BinaryTree{key: 11, data: 11})
      |> BinaryTree.insert(%BinaryTree{key: 26, data: 26})
      |> BinaryTree.insert(%BinaryTree{key: 1, data: 1})
      |> BinaryTree.insert(%BinaryTree{key: 21, data: 58})
    searchNode = BinaryTree.search(binaryTree, 21)
    binaryNode = BinaryTree.successor(binaryTree, searchNode)
    assert binaryNode.key == 22
    assert binaryNode.data == 22
    searchNode = BinaryTree.search(binaryTree, 11)
    binaryNode = BinaryTree.successor(binaryTree, searchNode)
    assert binaryNode.key == 20
    assert binaryNode.data == 20
    searchNode = BinaryTree.search(binaryTree, 1)
    binaryNode = BinaryTree.successor(binaryTree, searchNode)
    assert binaryNode.key == 11
    assert binaryNode.data == 11
  end

  test "Should delete a node in a tree" do
    binaryTree = %BinaryTree{key: 20, data: 20} 
      |> BinaryTree.insert(%BinaryTree{key: 22, data: 22})
      |> BinaryTree.insert(%BinaryTree{key: 11, data: 11})
      |> BinaryTree.insert(%BinaryTree{key: 26, data: 26})
      |> BinaryTree.insert(%BinaryTree{key: 1, data: 1})
      |> BinaryTree.insert(%BinaryTree{key: 21, data: 58})
      |> BinaryTree.insert(%BinaryTree{key: 15, data: 15})

    # delete a left leaf
    searchNode = BinaryTree.search(binaryTree, 21)
    binaryTree = BinaryTree.delete(binaryTree, searchNode)
    assert binaryTree.key == 20
    assert binaryTree.right.key == 22
    assert binaryTree.right.left == nil
    assert binaryTree.right.right.key == 26

    # delete a right leaf
    searchNode = BinaryTree.search(binaryTree, 26)
    binaryTree = BinaryTree.delete(binaryTree, searchNode)
    assert binaryTree.key == 20
    assert binaryTree.right.key == 22
    assert binaryTree.right.left == nil
    assert binaryTree.right.right == nil

    # delete a node with 2 leafs
    searchNode = BinaryTree.search(binaryTree, 11)
    binaryTree = BinaryTree.delete(binaryTree, searchNode)
    assert binaryTree.key == 20
    assert binaryTree.right.key == 22
    assert binaryTree.right.left == nil
    assert binaryTree.right.right == nil
    assert binaryTree.left.key == 15
    assert binaryTree.left.left.key == 1
    assert binaryTree.left.right == nil

    # delete root
    searchNode = BinaryTree.search(binaryTree, 20)
    binaryTree = BinaryTree.delete(binaryTree, searchNode)
    assert binaryTree.key == 22
    assert binaryTree.right == nil
    assert binaryTree.left.key == 15
    assert binaryTree.left.left.key == 1
    assert binaryTree.left.right == nil

    # should try to delete a unexistent node without error
    binaryTree = BinaryTree.delete(binaryTree, searchNode)
    assert binaryTree.key == 22
    assert binaryTree.right == nil
    assert binaryTree.left.key == 15
    assert binaryTree.left.left.key == 1
    assert binaryTree.left.right == nil

  end
end