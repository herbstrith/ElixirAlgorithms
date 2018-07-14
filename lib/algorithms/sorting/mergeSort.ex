defmodule Algorithms.Sorting.MergeSort do
  @moduledoc """
    This is the MergeSort module.
    It uses the merge sort algorithm to sort a list of numbers.

    Pros of insertion sort:
      nlogn complexity
      recursive by definition
  """
  @doc """
    Returns the sorted given 'list'

    ## Examples


      iex> Algorithms.Sorting.MergeSort.sort([1,5,4,8,3,2])
      [1,2,3,4,5,8]
  """
  def sort(list) do
    list_length = length(list)

    if list_length < 2 do
      list
    else
      {left, right} = Enum.split(list, div(list_length, 2))
      merge(sort(left), sort(right))
    end
  end

  defp merge(_left = [], right) do
    right
  end

  defp merge(left, _right = []) do
    left
  end

  defp merge(left = [lhead | ltail], right = [rhead | rtail]) do
    if lhead < rhead do
      [lhead | merge(ltail, right)]
    else
      [rhead | merge(left, rtail)]
    end
  end
end
