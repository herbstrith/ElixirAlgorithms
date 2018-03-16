defmodule StackTests do
  alias Algorithms.DataStructures.Stack, as: Stack
  use ExUnit.Case, async: true
  doctest Algorithms

  test "Should create a empty stack" do
    stack = %Stack{}
    assert length(stack.stack) == 0
    assert stack.top == 0
  end

  test "Should return that a empty stack is empty" do
    stack = %Stack{}
    assert Stack.empty(stack) == true
  end

  test "Should return that a stack with elements is not empty" do
    stack = %Stack{}
    stack = Stack.push(stack, -99)|>Stack.push(1)
    assert Stack.empty(stack) == false
  end

  test "Should push to a element stack" do
    stack = %Stack{}
    stack = Stack.push(stack, -99)
    assert length(stack.stack) == 1
    assert stack.top == 1
  end

  test "Should push 3 elements to a stack" do
    stack = %Stack{}
    stack = Stack.push(stack, -99)|>Stack.push(1)|>Stack.push(5)
    assert length(stack.stack) == 3
    assert stack.top == 3
  end

  test "Should push and pop a element from a stack" do
    stack = %Stack{}
    stack = Stack.push(stack, -99)
    {element, stack} = Stack.pop(stack)
    assert length(stack.stack) == 0
    assert stack.top == 0
    assert element == -99
  end

  test "Should push 3 elements to a stack and then pop one element" do
    stack = %Stack{}
    stack = Stack.push(stack, -99)|>Stack.push(1)|>Stack.push(5)
    {element, stack} = Stack.pop(stack)
    assert length(stack.stack) == 2
    assert stack.top == 2
    assert element == 5
  end

  test "Should push 3 elements to a stack and then pop all of them in the correct order" do
    stack = %Stack{}
    stack = Stack.push(stack, -99)|>Stack.push(1)|>Stack.push(5)
    {element1, stack} = Stack.pop(stack)
    {element2, stack} = Stack.pop(stack)
    {element3, stack} = Stack.pop(stack)
    assert length(stack.stack) == 0
    assert stack.top == 0
    assert element1 == 5
    assert element2 == 1
    assert element3 == -99
  end

  test "Should give an error when popping an empty stack" do
    stack = %Stack{}
    assert_raise ArgumentError, fn -> stack.pop(stack) end
  end
end