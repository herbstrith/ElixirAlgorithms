defmodule Algorithms.Sorting.HeapSort do
  @moduledoc """
    Sorts a list of non-negative numbers
    using heap sort algorithm

    Pros of heap sort:
      nlogn complexity

    Cons of heap sort:
      unstable
  """

  @doc """
    Returns the sorted given 'list'

    ## Examples


      iex> Algorithms.Sorting.HeapSort.sort([1,5,4,8,3,2])
      [1,2,3,4,5,8]

  """
  def sort(list) do
    list_length = length(list)
    heap = build_max_heap(list)
    heap_sort(heap, list_length - 1, list_length - 1)
  end

  defp heap_sort(list, index, list_length) do
    if index > 0 do
      list_length = list_length - 1
      new_list = exchange(list, index, 0)
      heap = max_heapify(new_list, 0, list_length)
      index = index - 1
      heap_sort(heap, index, list_length)
    else
      list
    end
  end

  def build_max_heap(list) do
    list_length = length(list)
    build_max_heap(list, div(list_length, 2) - 1, list_length - 1)
  end

  defp build_max_heap(heap, index, list_size) do
    if index >= 0 do
      myHeap = max_heapify(heap, index, list_size)
      index = index - 1
      build_max_heap(myHeap, index, list_size)
    else
      heap
    end
  end

  # would be better if we didnt have to access values at index or know the length
  defp max_heapify(list, index, list_length) do
    left_value = Enum.at(list, left(index))
    right_value = Enum.at(list, right(index))
    actual_value = Enum.at(list, index)

    largest =
      case left(index) <= list_length and left_value > actual_value do
        true -> left(index)
        false -> index
      end

    largest =
      case right(index) <= list_length and right_value > Enum.at(list, largest) do
        true -> right(index)
        false -> largest
      end

    if largest != index do
      updated_list = exchange(list, index, largest)
      max_heapify(updated_list, largest, list_length)
    else
      list
    end
  end

  defp exchange(list, index, largest) do
    temp = Enum.at(list, index)
    new_list = List.update_at(list, index, fn _a -> Enum.at(list, largest) end)
    List.update_at(new_list, largest, fn _a -> temp end)
  end

  defp left(index) do
    # minus one since our index starts at 0
    2 * (index + 1) - 1
  end

  defp right(index) do
    # minus one since our index starts at 0
    2 * (index + 1) + 1 - 1
  end
end
