defmodule Algorithms.DataStructures.QueueTests do
  alias Algorithms.DataStructures.Queue, as: Queue
  use ExUnit.Case, async: true

  test "Should create a empty queue" do
    queue = %Queue{}
    assert length(queue.queue) == 0
    assert queue.length == 0
  end

  test "Should return that a empty queue is empty" do
    queue = %Queue{}
    assert Queue.empty(queue) == true
  end

  test "Should return that a queue with elements is not empty" do
    queue = %Queue{}
    queue = Queue.enqueue(queue, -99) |> Queue.enqueue(1)
    assert Queue.empty(queue) == false
  end

  test "Should enqueue to a element queue" do
    queue = %Queue{}
    queue = Queue.enqueue(queue, -99)
    assert length(queue.queue) == 1
    assert queue.length == 1
  end

  test "Should enqueue 3 elements to a queue" do
    queue = %Queue{}
    queue = Queue.enqueue(queue, -99) |> Queue.enqueue(1) |> Queue.enqueue(5)
    assert length(queue.queue) == 3
    assert queue.length == 3
  end

  test "Should enqueue and dequeue a element from a queue" do
    queue = %Queue{}
    queue = Queue.enqueue(queue, -99)
    {element, queue} = Queue.dequeue(queue)
    assert length(queue.queue) == 0
    assert queue.length == 0
    assert element == -99
  end

  test "Should enqueue 3 elements to a queue and then dequeue one element" do
    queue = %Queue{}
    queue = Queue.enqueue(queue, -99) |> Queue.enqueue(1) |> Queue.enqueue(5)
    {element, queue} = Queue.dequeue(queue)
    assert length(queue.queue) == 2
    assert queue.length == 2
    assert element == -99
  end

  test "Should enqueue 3 elements to a queue and then dequeue all of them in the correct order" do
    queue = %Queue{}
    queue = Queue.enqueue(queue, -99) |> Queue.enqueue(1) |> Queue.enqueue(5)
    {element1, queue} = Queue.dequeue(queue)
    {element2, queue} = Queue.dequeue(queue)
    {element3, queue} = Queue.dequeue(queue)
    assert length(queue.queue) == 0
    assert queue.length == 0
    assert element1 == -99
    assert element2 == 1
    assert element3 == 5
  end

  test "Should give an error when dequeueping an empty queue" do
    queue = %Queue{}
    assert_raise ArgumentError, fn -> queue.dequeue(queue) end
  end
end
