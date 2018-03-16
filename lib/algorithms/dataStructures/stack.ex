defmodule Algorithms.DataStructures.Stack do
  alias Algorithms.DataStructures.Stack, as: Stack
  defstruct stack: [], top: 0

  def empty(stack) do
    stack.top == 0
  end

  def push(stack, element) do
    %Stack{top: stack.top + 1, stack: [element|stack.stack] }
  end

  def pop(stack = %Stack{top: top})  when top > 0 do
    {
      hd(stack.stack),
      %Stack{stack: tl(stack.stack), top: stack.top - 1}
    }
  end
end