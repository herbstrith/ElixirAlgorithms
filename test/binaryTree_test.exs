defmodule Algorithms.DataStructures.BinaryTreeTests do
  alias Algorithms.DataStructures.BinaryTree, as: BinaryTree
  use ExUnit.Case, async: true

  test "Should create a empty tree" do
    binary_tree = %BinaryTree{}
    assert binary_tree != nil
    assert binary_tree.key == nil
    assert binary_tree.data == nil
    assert binary_tree.left == nil
  end

  test "Should insert in a tree (new key should be on the left)" do
    new_node = %BinaryTree{key: 15, data: 15}
    binary_tree = %BinaryTree{key: 20, data: 20} |> BinaryTree.insert(new_node)
    assert binary_tree.key != nil
    assert binary_tree.data != nil
    assert binary_tree.right == nil
    assert binary_tree.left != nil
    assert binary_tree.left.key == 15
    assert binary_tree.left.data == 15
    assert binary_tree.left.parent == binary_tree.key
  end

  test "Should insert in a tree (new key should be on the right)" do
    new_node = %BinaryTree{key: 22, data: 22}
    binary_tree = %BinaryTree{key: 20, data: 20} |> BinaryTree.insert(new_node)
    assert binary_tree.key != nil
    assert binary_tree.data != nil
    assert binary_tree.left == nil
    assert binary_tree.right != nil
    assert binary_tree.right.key == 22
    assert binary_tree.right.data == 22
    assert binary_tree.right.parent == binary_tree.key
  end

  test "Should insert multiple times in a tree" do
    binary_tree =
      %BinaryTree{key: 20, data: 20}
      |> BinaryTree.insert(%BinaryTree{key: 22, data: 22})
      |> BinaryTree.insert(%BinaryTree{key: 11, data: 11})
      |> BinaryTree.insert(%BinaryTree{key: 21, data: 21})

    assert binary_tree.key != nil
    assert binary_tree.data != nil
    assert binary_tree.right.key == 22
    assert binary_tree.right.data == 22
    assert binary_tree.right.parent == binary_tree.key
    assert binary_tree.left.key == 11
    assert binary_tree.left.data == 11
    assert binary_tree.left.parent == binary_tree.key
    assert binary_tree.right.left.key == 21
    assert binary_tree.right.left.data == 21
    assert binary_tree.right.left.parent == binary_tree.right.key
  end

  test "Should insert multiple times in a tree and then search" do
    binary_tree =
      %BinaryTree{key: 20, data: 20}
      |> BinaryTree.insert(%BinaryTree{key: 22, data: 22})
      |> BinaryTree.insert(%BinaryTree{key: 11, data: 11})
      |> BinaryTree.insert(%BinaryTree{key: 21, data: 58})

    binary_node = BinaryTree.search(binary_tree, 21)
    assert binary_node.key == 21
    assert binary_node.data == 58
    binary_node = BinaryTree.search(binary_tree, 11)
    assert binary_node.key == 11
    assert binary_node.data == 11
    binary_node = BinaryTree.search(binary_tree, 20)
    assert binary_node.key == 20
    assert binary_node.data == 20
    binary_node = BinaryTree.search(binary_tree, 48)
    assert binary_node == nil
  end

  test "Should get the minimum in a tree" do
    binary_tree =
      %BinaryTree{key: 20, data: 20}
      |> BinaryTree.insert(%BinaryTree{key: 22, data: 22})
      |> BinaryTree.insert(%BinaryTree{key: 11, data: 11})
      |> BinaryTree.insert(%BinaryTree{key: 26, data: 26})
      |> BinaryTree.insert(%BinaryTree{key: 1, data: 1})
      |> BinaryTree.insert(%BinaryTree{key: 21, data: 58})

    binary_node = BinaryTree.minimum(binary_tree)
    assert binary_node.key == 1
    assert binary_node.data == 1
  end

  test "Should get the minimum in a empty tree" do
    binary_tree = %BinaryTree{}
    binary_node = BinaryTree.minimum(binary_tree)
    assert binary_node.key == nil
  end

  test "Should get the maximum in a tree" do
    binary_tree =
      %BinaryTree{key: 20, data: 20}
      |> BinaryTree.insert(%BinaryTree{key: 22, data: 22})
      |> BinaryTree.insert(%BinaryTree{key: 11, data: 11})
      |> BinaryTree.insert(%BinaryTree{key: 26, data: 26})
      |> BinaryTree.insert(%BinaryTree{key: 1, data: 1})
      |> BinaryTree.insert(%BinaryTree{key: 21, data: 58})

    binary_node = BinaryTree.maximum(binary_tree)
    assert binary_node.key == 26
    assert binary_node.data == 26
  end

  test "Should get the maximum in a empty tree" do
    binary_tree = %BinaryTree{}
    binary_node = BinaryTree.maximum(binary_tree)
    assert binary_node.key == nil
  end

  test "Should get the successor in a tree" do
    binary_tree =
      %BinaryTree{key: 20, data: 20}
      |> BinaryTree.insert(%BinaryTree{key: 22, data: 22})
      |> BinaryTree.insert(%BinaryTree{key: 11, data: 11})
      |> BinaryTree.insert(%BinaryTree{key: 26, data: 26})
      |> BinaryTree.insert(%BinaryTree{key: 1, data: 1})
      |> BinaryTree.insert(%BinaryTree{key: 21, data: 58})

    search_node = BinaryTree.search(binary_tree, 21)
    binary_node = BinaryTree.successor(binary_tree, search_node)
    assert binary_node.key == 22
    assert binary_node.data == 22
    search_node = BinaryTree.search(binary_tree, 11)
    binary_node = BinaryTree.successor(binary_tree, search_node)
    assert binary_node.key == 20
    assert binary_node.data == 20
    search_node = BinaryTree.search(binary_tree, 1)
    binary_node = BinaryTree.successor(binary_tree, search_node)
    assert binary_node.key == 11
    assert binary_node.data == 11
  end

  test "Should delete a node in a tree" do
    binary_tree =
      %BinaryTree{key: 20, data: 20}
      |> BinaryTree.insert(%BinaryTree{key: 22, data: 22})
      |> BinaryTree.insert(%BinaryTree{key: 11, data: 11})
      |> BinaryTree.insert(%BinaryTree{key: 26, data: 26})
      |> BinaryTree.insert(%BinaryTree{key: 1, data: 1})
      |> BinaryTree.insert(%BinaryTree{key: 21, data: 58})
      |> BinaryTree.insert(%BinaryTree{key: 15, data: 15})

    # delete a left leaf
    search_node = BinaryTree.search(binary_tree, 21)
    binary_tree = BinaryTree.delete(binary_tree, search_node)
    assert binary_tree.key == 20
    assert binary_tree.right.key == 22
    assert binary_tree.right.left == nil
    assert binary_tree.right.right.key == 26

    # delete a right leaf
    search_node = BinaryTree.search(binary_tree, 26)
    binary_tree = BinaryTree.delete(binary_tree, search_node)
    assert binary_tree.key == 20
    assert binary_tree.right.key == 22
    assert binary_tree.right.left == nil
    assert binary_tree.right.right == nil

    # delete a node with 2 leafs
    search_node = BinaryTree.search(binary_tree, 11)
    binary_tree = BinaryTree.delete(binary_tree, search_node)
    assert binary_tree.key == 20
    assert binary_tree.right.key == 22
    assert binary_tree.right.left == nil
    assert binary_tree.right.right == nil
    assert binary_tree.left.key == 15
    assert binary_tree.left.left.key == 1
    assert binary_tree.left.right == nil

    # delete root
    search_node = BinaryTree.search(binary_tree, 20)
    binary_tree = BinaryTree.delete(binary_tree, search_node)
    assert binary_tree.key == 22
    assert binary_tree.right == nil
    assert binary_tree.left.key == 15
    assert binary_tree.left.left.key == 1
    assert binary_tree.left.right == nil

    # should try to delete a unexistent node without error
    binary_tree = BinaryTree.delete(binary_tree, search_node)
    assert binary_tree.key == 22
    assert binary_tree.right == nil
    assert binary_tree.left.key == 15
    assert binary_tree.left.left.key == 1
    assert binary_tree.left.right == nil
  end
end
