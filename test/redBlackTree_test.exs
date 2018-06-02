defmodule Algorithms.DataStructures.RedBlackTreeTests do
  alias Algorithms.DataStructures.RedBlackTree, as: RBTree
  use ExUnit.Case, async: true

  test "Should create a empty tree" do
    rbTree = %RBTree{}
    assert rbTree != nil
    assert rbTree.key == nil
    assert rbTree.data == nil
    assert rbTree.left == nil
  end

  test "Should create a empty tree (method call)" do
    rbTree = RBTree.create()
    assert rbTree != nil
    assert rbTree.key == nil
    assert rbTree.data == nil
    assert rbTree.left == nil
  end

  test "Should create a tree if none is passed" do
    rbTree = RBTree.insert(%RBTree{key: 15, data: 15})
    assert rbTree.key == 15
    assert rbTree.data == 15
    assert rbTree.color == :red
    assert rbTree.left == nil
    assert rbTree.right == nil
  end

  test "Should create a tree if nil is passed" do
    rbTree = RBTree.insert(nil, %RBTree{key: 15, data: 15})
    assert rbTree.key == 15
    assert rbTree.data == 15
    assert rbTree.color == :red
    assert rbTree.left == nil
    assert rbTree.right == nil
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

  test "Should delete every node of a tree" do
    originalBinaryTree = RBTree.insert(%RBTree{key: 1, data: 1}) |>
      RBTree.insert(%RBTree{key: 2, data: 2}) |>
      RBTree.insert(%RBTree{key: 3, data: 3}) |>
      RBTree.insert(%RBTree{key: 4, data: 4}) |>
      RBTree.insert(%RBTree{key: 5, data: 5}) |>
      RBTree.insert(%RBTree{key: 6, data: 6}) |>
      RBTree.insert(%RBTree{key: 7, data: 7}) |>
      RBTree.insert(%RBTree{key: 8, data: 8}) |>
      RBTree.insert(%RBTree{key: 9, data: 9}) |>
      RBTree.insert(%RBTree{key: 10, data: 10}) |>
      RBTree.insert(%RBTree{key: 11, data: 11}) |>
      RBTree.insert(%RBTree{key: 12, data: 12}) |>
      RBTree.insert(%RBTree{key: 13, data: 13}) |>
      RBTree.insert(%RBTree{key: 14, data: 14}) |>
      RBTree.insert(%RBTree{key: 15, data: 15})
    deleteTree = RBTree.delete(originalBinaryTree, 1)
    searchNode = RBTree.search(deleteTree, 1)
    assert searchNode == nil
    deleteTree = RBTree.delete(originalBinaryTree, 2)
    searchNode = RBTree.search(deleteTree, 2)
    assert searchNode == nil
    deleteTree = RBTree.delete(originalBinaryTree, 3)
    searchNode = RBTree.search(deleteTree, 3)
    assert searchNode == nil
    deleteTree = RBTree.delete(originalBinaryTree, 4)
    searchNode = RBTree.search(deleteTree, 4)
    assert searchNode == nil
    deleteTree = RBTree.delete(originalBinaryTree, 5)
    searchNode = RBTree.search(deleteTree, 5)
    assert searchNode == nil
    deleteTree = RBTree.delete(originalBinaryTree, 6)
    searchNode = RBTree.search(deleteTree, 6)
    assert searchNode == nil
    deleteTree = RBTree.delete(originalBinaryTree, 7)
    searchNode = RBTree.search(deleteTree, 7)
    assert searchNode == nil
    deleteTree = RBTree.delete(originalBinaryTree, 8)
    searchNode = RBTree.search(deleteTree, 8)
    assert searchNode == nil
    deleteTree = RBTree.delete(originalBinaryTree, 9)
    searchNode = RBTree.search(deleteTree, 9)
    assert searchNode == nil
    deleteTree = RBTree.delete(originalBinaryTree, 10)
    searchNode = RBTree.search(deleteTree, 10)
    assert searchNode == nil
    deleteTree = RBTree.delete(originalBinaryTree, 11)
    searchNode = RBTree.search(deleteTree, 11)
    assert searchNode == nil
    deleteTree = RBTree.delete(originalBinaryTree, 12)
    searchNode = RBTree.search(deleteTree, 12)
    assert searchNode == nil
    deleteTree = RBTree.delete(originalBinaryTree, 13)
    searchNode = RBTree.search(deleteTree, 13)
    assert searchNode == nil
    deleteTree = RBTree.delete(originalBinaryTree, 14)
    searchNode = RBTree.search(deleteTree, 14)
    assert searchNode == nil
    deleteTree = RBTree.delete(originalBinaryTree, 15)
    searchNode = RBTree.search(deleteTree, 15)
    assert searchNode == nil
  end

  test "Should delete corner case nodes" do
    baseTree = %RBTree{color: :black, key: 8, data: 8, left: %RBTree{color: :red, key: 4, data: 4, left: nil, right: nil}, right: %RBTree{color: :red, key: 14, data: 14, left: nil, right: nil}}
    testTree = %RBTree{color: :black, key: 8, data: 8, left: %RBTree{color: :red, key: 4, data: 4, left: nil, right: nil}, right: nil}
    deleteTree = RBTree.delete(testTree, 10)
    searchNode = RBTree.search(deleteTree, 8)
    assert searchNode != nil

    testTree = %RBTree{color: :black, key: 5, data: 5,
     left: %RBTree{color: :red, key: 4, data: 4, left: nil, right: nil},
     right: %RBTree{color: :black, key: 8, data: 8, left: nil, right: nil}}
    deleteTree =  RBTree.delete(testTree, 10)
    searchNode = RBTree.search(deleteTree, 5)
    assert searchNode != nil

    testTree = %RBTree{color: :black, key: 5, data: 5,
     left: %RBTree{color: :red, key: 4, data: 4, left: nil, right: nil},
     right: %RBTree{color: :black, key: 8, data: 8, left: nil, right: nil}}
    deleteTree =  RBTree.delete(testTree, 7)
    searchNode = RBTree.search(deleteTree, 5)
    assert searchNode != nil

    testTree = %RBTree{color: :black, key: 5, data: 5,
     left: %RBTree{color: :red, key: 4, data: 4, left: nil, right: nil},
     right: nil}
    deleteTree = RBTree.delete(testTree, 3)
    searchNode = RBTree.search(deleteTree, 5)
    assert searchNode != nil

    testTree = %RBTree{color: :black, key: 5, data: 5,
     left: %RBTree{color: :red, key: 4, data: 4, left: nil, right: nil},
     right: nil}
    deleteTree = RBTree.delete(testTree, 1)
    searchNode = RBTree.search(deleteTree, 5)
    assert searchNode != nil

    testTree =  %RBTree{color: :red, key: 20, data: 20,
      left:
        %RBTree{color: :black, key: 5, data: 5,
          left: %RBTree{color: :blackblack, key: 4, data: 4,
            left: nil,
            right: nil},
          right: %RBTree{color: :black, key: 6, data: 6,
            left: nil,
            right: nil},
          },
      right: deleteTree,
    }
    deleteTree = RBTree.delete(testTree, 5)
    searchNode = RBTree.search(deleteTree, 5)
    assert searchNode == nil

    testTree = %RBTree{color: :red, key: 20, data: 20,
      left:
        %RBTree{color: :black, key: 5, data: 5,
        left: %RBTree{color: :blackblack, key: 4, data: 4,
          left: nil,
          right: nil},
        right: %RBTree{color: :red, key: 6, data: 6,
          left: nil,
          right: nil}
        },
      right: baseTree,
    }
    deleteTree = RBTree.delete(testTree, 5)
    searchNode = RBTree.search(deleteTree, 15)
    assert searchNode == nil

    testTree = %RBTree{color: :red, key: 20, data: 20,
      left:
        %RBTree{color: :black, key: 5, data: 5,
        left: %RBTree{color: :black, key: 4, data: 4,
          left: baseTree,
          right: baseTree},
        right: %RBTree{color: :blackblack, key: 6, data: 6,
          left: baseTree,
          right: baseTree}
        },
      right: baseTree,
    }
    deleteTree = RBTree.delete(testTree, 5)
    searchNode = RBTree.search(deleteTree, 15)
    assert searchNode == nil

    testTree = %RBTree{color: :red, key: 20, data: 20,
      left: %RBTree{color: :black, key: 5, data: 5,
        left: %RBTree{color: :blackblack, key: 4, data: 4,
          left: baseTree,
          right: baseTree},
        right: %RBTree{color: :red, key: 8, data: 8,
          left: %RBTree{color: :black, key: 7, data: 7,
            left: baseTree,
            right: baseTree,
          },
          right: baseTree,
          }},
      right: baseTree
    }
    deleteTree = RBTree.delete(testTree, 5)
    searchNode = RBTree.search(deleteTree, 5)
    assert searchNode == nil
  end



  test "should delete a whole tree" do
    originalBinaryTree = %RBTree{key: 14, data: 14, color: :black} |>
      RBTree.insert(%RBTree{key: 15, data: 15}) |>
      RBTree.insert(%RBTree{key: 20, data: 20}) |>
      RBTree.insert(%RBTree{key: 22, data: 22}) |>
      RBTree.insert(%RBTree{key: 25, data: 25}) |>
      RBTree.insert(%RBTree{key: 10, data: 10}) |>
      RBTree.insert(%RBTree{key: 18, data: 18}) |>
      RBTree.insert(%RBTree{key: 45, data: 45}) |>
      RBTree.insert(%RBTree{key: 2, data: 2}) |>
      RBTree.insert(%RBTree{key: 1, data: 1}) |>
      RBTree.insert(%RBTree{key: 2, data: 2}) |>
      RBTree.insert(%RBTree{key: 3, data: 3}) |>
      RBTree.insert(%RBTree{key: 4, data: 4}) |>
      RBTree.insert(%RBTree{key: 5, data: 5}) |>
      RBTree.insert(%RBTree{key: 6, data: 6}) |>
      RBTree.insert(%RBTree{key: 7, data: 7}) |>
      RBTree.insert(%RBTree{key: 8, data: 8})
    binaryTree = RBTree.delete(originalBinaryTree, 14) |>
      RBTree.delete( 15) |>
      RBTree.delete(20) |>
      RBTree.delete(22) |>
      RBTree.delete(25) |>
      RBTree.delete(10) |>
      RBTree.delete(18) |>
      RBTree.delete(45) |>
      RBTree.delete(2) |>
      RBTree.delete(1) |>
      RBTree.delete(2) |>
      RBTree.delete(3) |>
      RBTree.delete(4) |>
      RBTree.delete(5) |>
      RBTree.delete(6) |>
      RBTree.delete(7) |>
      RBTree.delete(8)
    assert binaryTree == :emptyempty
  end

  test "should delete a whole tree 2" do
    originalBinaryTree = %RBTree{key: 14, data: 14, color: :black} |>
      RBTree.insert(%RBTree{key: 15, data: 15}) |>
      RBTree.insert(%RBTree{key: 20, data: 20}) |>
      RBTree.insert(%RBTree{key: 22, data: 22}) |>
      RBTree.insert(%RBTree{key: 25, data: 25}) |>
      RBTree.insert(%RBTree{key: 10, data: 10}) |>
      RBTree.insert(%RBTree{key: 18, data: 18}) |>
      RBTree.insert(%RBTree{key: 45, data: 45}) |>
      RBTree.insert(%RBTree{key: 2, data: 2}) |>
      RBTree.insert(%RBTree{key: 1, data: 1}) |>
      RBTree.insert(%RBTree{key: 2, data: 2}) |>
      RBTree.insert(%RBTree{key: 3, data: 3}) |>
      RBTree.insert(%RBTree{key: 4, data: 4}) |>
      RBTree.insert(%RBTree{key: 5, data: 5}) |>
      RBTree.insert(%RBTree{key: 6, data: 6}) |>
      RBTree.insert(%RBTree{key: 7, data: 7}) |>
      RBTree.insert(%RBTree{key: 8, data: 8}) |>
      RBTree.insert(%RBTree{key: 48, data: 48}) |>
      RBTree.insert(%RBTree{key: 49, data: 49}) |>
      RBTree.insert(%RBTree{key: 60, data: 60}) |>
      RBTree.insert(%RBTree{key: 65, data: 65}) |>
      RBTree.insert(%RBTree{key: 70, data: 70}) |>
      RBTree.insert(%RBTree{key: 85, data: 85}) |>
      RBTree.insert(%RBTree{key: 90, data: 90}) |>
      RBTree.insert(%RBTree{key: 100, data: 100})
    deleteTree = RBTree.delete(originalBinaryTree, 48)
    deleteTree = RBTree.delete(originalBinaryTree, 49)
    deleteTree = RBTree.delete(originalBinaryTree, 60)
    deleteTree = RBTree.delete(originalBinaryTree, 65)
    deleteTree = RBTree.delete(originalBinaryTree, 70)
    deleteTree = RBTree.delete(originalBinaryTree, 85)
    deleteTree = RBTree.delete(originalBinaryTree, 90)
    deleteTree = RBTree.delete(originalBinaryTree, 100)
    deleteTree = RBTree.delete(originalBinaryTree, 14)
    deleteTree = RBTree.delete(originalBinaryTree, 15)
    deleteTree = RBTree.delete(originalBinaryTree, 20)
    deleteTree = RBTree.delete(originalBinaryTree, 22)
    deleteTree = RBTree.delete(originalBinaryTree, 25)
    deleteTree = RBTree.delete(originalBinaryTree, 10)
    deleteTree = RBTree.delete(originalBinaryTree, 18)
    deleteTree = RBTree.delete(originalBinaryTree, 45)
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

  test "Should search in a tree" do
    newNode = %RBTree{key: 15, data: 15}
    newNode2 = %RBTree{key: 14, data: 14}
    binaryTree = %RBTree{key: 20, data: 20, color: :black} |> RBTree.insert(newNode) |> RBTree.insert(newNode2)
    searchNode = RBTree.search(binaryTree, 20)
    assert searchNode.data == 20
    searchNode = RBTree.search(binaryTree, 15)
    assert searchNode.data == 15
    searchNode = RBTree.search(binaryTree, 14)
    assert searchNode.data == 14
    searchNode = RBTree.search(binaryTree, 45)
    assert searchNode == nil
  end

end
