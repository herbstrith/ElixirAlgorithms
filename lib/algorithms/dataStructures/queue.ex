defmodule Algorithms.DataStructures.Queue do
  alias Algorithms.DataStructures.Queue, as: Queue
  defstruct queue: [], length: 0

  def empty(queue) do
    queue.length == 0
  end

  def enqueue(queue, element) do
    %Queue{
      length: queue.length + 1,
      queue: queue.queue ++ [element]
    }
  end

  def dequeue(queue = %Queue{length: length})  when length > 0 do
    {
      hd(queue.queue),
      %Queue{queue: tl(queue.queue), length: queue.length - 1}
    }
  end
end