defmodule Tree do
  defstruct value: 0,left: nil, right: nil
end

#methods are not tail recursive unfortunately
defmodule BalancedBinaryTree do
  def create() do
    %Tree{}
  end

  def insert(actualTree = %Tree{left: nil, right: nil}, value) do
    if (actualTree.value < value) do
      %Tree{value: actualTree.value, left: actualTree.left, right: %Tree{value: value}}
    else
      %Tree{value: actualTree.value, left: %Tree{value: value},  right: actualTree.right}
    end
  end

  def insert(actualTree = %Tree{right: nil}, value) do
    if (actualTree.value < value) do
      %Tree{value: actualTree.value, left: insert(actualTree.left, value),  right: actualTree.right}
    else
      %Tree{value: actualTree.value, left: insert(actualTree.left, value),  right: actualTree.right}
    end
  end

  def insert(actualTree = %Tree{left: nil}, value) do
    if (actualTree.value < value) do
      %Tree{value: actualTree.value, left: actualTree.left, right: insert(actualTree.right, value)}
    else
      %Tree{value: actualTree.value, left: %Tree{value: value},  right: actualTree.right}
    end
  end
end

#use a module so that we can use the structs defined on this script
defmodule Main do
  def main do
    myTree = BalancedBinaryTree.create()
    myTree = BalancedBinaryTree.insert(myTree, 2)
    myTree = BalancedBinaryTree.insert(myTree, 1)
    myTree = BalancedBinaryTree.insert(myTree, -1)
    IO.puts(inspect(myTree))
  end
end

Main.main