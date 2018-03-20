defmodule Algorithms.Sorting.InsertionSort do
   @moduledoc """
    This is the Insertion Sort module.
    It uses the insertion sort algorithm to sort a list of numbers.

    Pros of insertion sort:
      stable
      efficient for small data that is almost sorted
    Cons of insertion sort:
      n² complexity
  """
  #method call
  def sort(list = []) do
    list
  end

  @doc """
    Returns the sorted given 'list'

    ## Examples


      iex> Algorithms.Sorting.InsertionSort.sort([1,5,4,8,3,2])
      [1,2,3,4,5,8]

  """
  def sort(list) do
    sort([hd(list)], tl(list))
  end

  # the last case of the recursion
  defp sort(outputList, _inputList = []) do
    outputList
  end
  # the "average" case when both lists have entries on them, input list must not be empty
  defp sort(outputList, _inputList = [head|tail]) do
    insertCrescent(head, outputList) |> sort(tail)
  end

  # when the output list is empty we just return the element
  defp insertCrescent(actualElement, _outputList = []) do
    [actualElement]
  end
  # Inserts the element in outputList
  defp insertCrescent(actualElement, _outputList = [head|tail]) do
    if (head >= actualElement) do
      [actualElement|[head|tail]]
    else
      [head|insertCrescent(actualElement, tail)]
    end
  end

end