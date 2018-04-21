defmodule RedBlackTreeTests do
  alias Algorithms.DataStructures.RedBlackTree, as: RBTree
  use ExUnit.Case, async: true

  doctest Algorithms
  test "Should create a empty tree" do
    rbTree = %RBTree{}
    assert rbTree != nil
    assert rbTree.key == nil
    assert rbTree.data == nil
    assert rbTree.left == nil
  end

  test "Should insert in a tree" do
    newNode = %RBTree{key: 15, data: 15}
    newNode2 = %RBTree{key: 14, data: 14}
    binaryTree = %RBTree{key: 20, data: 20, color: :black} |> RBTree.insert(newNode) |>  RBTree.insert(newNode2)
    assert binaryTree.key != nil
    assert binaryTree.data != nil
    assert binaryTree.right != nil
    assert binaryTree.left != nil
    assert binaryTree.left.key == 14
    assert binaryTree.left.data == 14
    assert binaryTree.right.key == 20
    assert binaryTree.right.data == 20
    assert binaryTree.key == 15
    assert binaryTree.data == 15
    binaryTree = RBTree.insert(binaryTree, %RBTree{key: 25, data: 25}) |> RBTree.insert(%RBTree{key: 30, data: 30})
    assert binaryTree.left.key == 14
    assert binaryTree.left.data == 14
    assert binaryTree.right.key == 25
    assert binaryTree.right.data == 25
    assert binaryTree.key == 15
    assert binaryTree.data == 15
    assert binaryTree.right.right.key == 30
    assert binaryTree.right.right.data == 30
    assert binaryTree.right.left.key == 20
    assert binaryTree.right.left.data == 20
    binaryTree = RBTree.insert(binaryTree, %RBTree{key: 23, data: 23}) |> RBTree.insert(%RBTree{key: 22, data: 22}) |> RBTree.insert(%RBTree{key: 19, data: 19})
    assert binaryTree.left.key == 15
    assert binaryTree.left.data == 15
    assert binaryTree.right.key == 25
    assert binaryTree.right.data == 25
    assert binaryTree.key == 22
    assert binaryTree.data == 22
    assert binaryTree.right.right.key == 30
    assert binaryTree.right.right.data == 30
    assert binaryTree.right.left.key == 23
    assert binaryTree.right.left.data == 23
    assert binaryTree.left.right.key == 20
    assert binaryTree.left.right.data == 20
    assert binaryTree.left.left.key == 14
    assert binaryTree.left.left.data == 14
  end

  test "Should delete in a tree" do
    newNode = %RBTree{key: 15, data: 15}
    newNode2 = %RBTree{key: 14, data: 14}
    binaryTree = %RBTree{key: 20, data: 20, color: :black} |> RBTree.insert(newNode) |> RBTree.insert(newNode2)
    binaryTree = RBTree.insert(binaryTree, %RBTree{key: 25, data: 25}) |> RBTree.insert(%RBTree{key: 30, data: 30})
    binaryTree = RBTree.insert(binaryTree, %RBTree{key: 23, data: 23}) |> RBTree.insert(%RBTree{key: 22, data: 22}) |> RBTree.insert(%RBTree{key: 19, data: 19})
    binaryTree = RBTree.delete(binaryTree, 20)
    assert binaryTree.left.key == 15
    assert binaryTree.left.data == 15
    assert binaryTree.right.key == 25
    assert binaryTree.right.data == 25
    assert binaryTree.key == 22
    assert binaryTree.data == 22
    assert binaryTree.right.right.key == 30
    assert binaryTree.right.right.data == 30
    assert binaryTree.right.left.key == 23
    assert binaryTree.right.left.data == 23
    assert binaryTree.left.right.key == 19
    assert binaryTree.left.right.data == 19
    assert binaryTree.left.left.key == 14
    assert binaryTree.left.left.data == 14
  end

  test "Should delete in a tree (left node)" do
    newNode = %RBTree{key: 15, data: 15}
    newNode2 = %RBTree{key: 14, data: 14}
    binaryTree = %RBTree{key: 20, data: 20, color: :black} |> RBTree.insert(newNode) |> RBTree.insert(newNode2)
    binaryTree = RBTree.insert(binaryTree, %RBTree{key: 25, data: 25}) |> RBTree.insert(%RBTree{key: 30, data: 30})
    binaryTree = RBTree.insert(binaryTree, %RBTree{key: 23, data: 23}) |> RBTree.insert(%RBTree{key: 22, data: 22}) |> RBTree.insert(%RBTree{key: 19, data: 19})
    binaryTree = RBTree.delete(binaryTree, 15)
    assert binaryTree.left.key == 19
    assert binaryTree.left.data == 19
    assert binaryTree.right.key == 25
    assert binaryTree.right.data == 25
    assert binaryTree.key == 22
    assert binaryTree.data == 22
    assert binaryTree.right.right.key == 30
    assert binaryTree.right.right.data == 30
    assert binaryTree.right.left.key == 23
    assert binaryTree.right.left.data == 23
    assert binaryTree.left.right.key == 20
    assert binaryTree.left.right.data == 20
    assert binaryTree.left.left.key == 14
    assert binaryTree.left.left.data == 14
  end

  test "Should delete in a tree (left node inner node)" do
    newNode = %RBTree{key: 15, data: 15}
    newNode2 = %RBTree{key: 14, data: 14}
    binaryTree = %RBTree{key: 20, data: 20, color: :black} |> RBTree.insert(newNode) |> RBTree.insert(newNode2)
    binaryTree = RBTree.insert(binaryTree, %RBTree{key: 25, data: 25}) |> RBTree.insert(%RBTree{key: 30, data: 30})
    binaryTree = RBTree.insert(binaryTree, %RBTree{key: 23, data: 23}) |> RBTree.insert(%RBTree{key: 22, data: 22}) |> RBTree.insert(%RBTree{key: 19, data: 19})
    binaryTree = RBTree.delete(binaryTree, 14)
    assert binaryTree.left.key == 19
    assert binaryTree.left.data == 19
    assert binaryTree.right.key == 25
    assert binaryTree.right.data == 25
    assert binaryTree.key == 22
    assert binaryTree.data == 22
    assert binaryTree.right.right.key == 30
    assert binaryTree.right.right.data == 30
    assert binaryTree.right.left.key == 23
    assert binaryTree.right.left.data == 23
    assert binaryTree.left.right.key == 20
    assert binaryTree.left.right.data == 20
    assert binaryTree.left.left.key == 15
    assert binaryTree.left.left.data == 15
  end

  test "Should delete in a tree (right node)" do
    newNode = %RBTree{key: 15, data: 15}
    newNode2 = %RBTree{key: 14, data: 14}
    binaryTree = %RBTree{key: 20, data: 20, color: :black} |> RBTree.insert(newNode) |> RBTree.insert(newNode2)
    binaryTree = RBTree.insert(binaryTree, %RBTree{key: 25, data: 25}) |> RBTree.insert(%RBTree{key: 30, data: 30})
    binaryTree = RBTree.insert(binaryTree, %RBTree{key: 23, data: 23}) |> RBTree.insert(%RBTree{key: 22, data: 22}) |> RBTree.insert(%RBTree{key: 19, data: 19})
    binaryTree = RBTree.delete(binaryTree, 25)
    assert binaryTree.left.key == 14
    assert binaryTree.left.data == 14
    assert binaryTree.right.key == 22
    assert binaryTree.right.data == 22
    assert binaryTree.key == 15
    assert binaryTree.data == 15
    assert binaryTree.right.right.key == 23
    assert binaryTree.right.right.data == 23
    assert binaryTree.right.left.key == 20
    assert binaryTree.right.left.data == 20
    assert binaryTree.right.left.left.key == 19
    assert binaryTree.right.left.left.data == 19
    assert binaryTree.right.right.right.key == 30
    assert binaryTree.right.right.right.data == 30
  end

  test "Should delete in a tree (right inner node)" do
    newNode = %RBTree{key: 15, data: 15}
    newNode2 = %RBTree{key: 14, data: 14}
    binaryTree = %RBTree{key: 20, data: 20, color: :black} |> RBTree.insert(newNode) |> RBTree.insert(newNode2)
    binaryTree = RBTree.insert(binaryTree, %RBTree{key: 25, data: 25}) |> RBTree.insert(%RBTree{key: 30, data: 30})
    binaryTree = RBTree.insert(binaryTree, %RBTree{key: 23, data: 23}) |> RBTree.insert(%RBTree{key: 22, data: 22}) |> RBTree.insert(%RBTree{key: 19, data: 19})
    binaryTree = RBTree.delete(binaryTree, 30)
    IO.puts(inspect(binaryTree))
    assert binaryTree.left.key == 14
    assert binaryTree.left.data == 14
    assert binaryTree.right.key == 22
    assert binaryTree.right.data == 22
    assert binaryTree.key == 15
    assert binaryTree.data == 15
    assert binaryTree.right.right.key == 23
    assert binaryTree.right.right.data == 23
    assert binaryTree.right.left.key == 20
    assert binaryTree.right.left.data == 20
    assert binaryTree.right.left.left.key == 19
    assert binaryTree.right.left.left.data == 19
  end
end
