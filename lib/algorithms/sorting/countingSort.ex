defmodule Algorithms.Sorting.CountingSort do
  @moduledoc """
    Sorts a list of non-negative numbers using
    the counting sort algorithm

    Pros of counting sort:
      O(n+k) complexity

    Cons of counting sort:
      only works for discrete values

  """

   @doc """
    Returns the sorted given 'list'

    ## Examples


      iex> Algorithms.Sorting.CountingSort.sort([1,5,4,8,3,2])
      [1,2,3,4,5,8]

  """
  def sort(list, k) do
    countList = countNumbers(List.duplicate(0, k + 1), list)
    countList = countLesserThan(countList, countList, 0, 0)
    sortedList = orderList(list, countList, list)
    sortedList
  end

  defp orderList(outputList, countList, _list = [head|tail]) do
    outputList = List.update_at(outputList, Enum.at(countList, head)-1, fn(_)->head end)
    orderList(outputList, countList,  tail)
  end

  defp orderList(outputList, _countList, _list = []) do
    outputList
  end

  defp countNumbers(outputList, _list = [head|tail]) do
    result = List.update_at(outputList, head, &(&1 + 1))
    countNumbers(result, tail)
  end

  defp countNumbers(outputList, _list = []) do
    outputList
  end

  defp countLesserThan(outputList, _list = [head|tail], count, index) do
    count = head + count
    result = List.update_at(outputList, index,
      fn (x) ->
        if (x > 0) do
          count
        else
          x
        end
      end)
    countLesserThan(result, tail, count, index+1)
  end

  defp countLesserThan(outputList, _list = [], _count, _index) do
    outputList
  end
end