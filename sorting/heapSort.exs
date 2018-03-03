defmodule HeapSort do

  def sort(list) do
    listLength = length(list)
    heap = buildMaxHeap(list)
    heapSort(heap, listLength - 1, listLength - 1)
  end

  defp heapSort(list, index, listLength) do
    if index > 0 do
      listLength = listLength - 1
      newList = exchange(list, index , 0)
      heap = maxHeapify(newList, 0, listLength)
      index = index - 1
      heapSort(heap, index, listLength)
    else
      list
    end
  end

  def buildMaxHeap(list) do
    listLength =  length(list)
    buildMaxHeap(list, div(listLength, 2) - 1, listLength - 1)
  end

  defp buildMaxHeap(heap, index, listSize) do
    if(index >= 0) do
      myHeap = maxHeapify(heap, index, listSize)
      index = index - 1
      buildMaxHeap(myHeap, index, listSize)
    else
      heap
    end
  end
  # would be better if we didnt have to access values at index or know the length
  defp maxHeapify(list, index, listLength) do
    leftValue = Enum.at(list, left(index))
    rightValue = Enum.at(list, right(index))
    actualValue = Enum.at(list, index)
    largest = case left(index) <= listLength and leftValue > actualValue do
      true -> left(index)
      false -> index
    end
    largest = case right(index) <= listLength and rightValue > Enum.at(list, largest) do
      true -> right(index)
      false -> largest
    end

    if largest != index do
      updatedList = exchange(list, index, largest)
      maxHeapify(updatedList, largest, listLength)
    else
      list
    end
  end

  defp exchange(list, index, largest) do
    temp = Enum.at(list, index)
    newList = List.update_at(list, index, fn (_a) -> Enum.at(list, largest) end)
    List.update_at(newList, largest, fn (_a) -> temp end)
  end

  defp left(index) do
    # minus one since our index starts at 0
    (2 * (index + 1)) - 1
  end

  defp right(index) do
    # minus one since our index starts at 0
    (2 * (index+1) + 1)-1
  end

  defp parent(index) do
    div(index + 1, 2)
  end

end