defmodule Algorithms.Sorting.QuickSort do
  @moduledoc """
    This is the QuickSort module.
    It uses the quick sort algorithm to sort a list of numbers.

    Pros of quick sort:
      average nlogn
      recursive by definition

    Cons of quick sort:
      bad worst case (bad pivot selection)
  """
  @doc """
    Returns the sorted given 'list'

    ## Examples


      iex> Algorithms.Sorting.QuickSort.sort([1,5,4,8,3,2])
      [1,2,3,4,5,8]
  """
  def sort(list = []) do
    list
  end

  def sort([head | tail]) do
    # get values that are bigger than head in one list and smaller in another
    # works as the "partition" part of the algorithm
    {left, right} =
      Enum.split_with(tail, fn x ->
        x < head
      end)

    # the two recursive calls where our "q" is defined by the head
    sort(left) ++ [head | sort(right)]
  end

  @doc """
    Returns the sorted given 'list', but uses a tail recursive implementation

    ## Examples


      iex> Algorithms.Sorting.InsertionSort.sort([1,5,4,8,3,2])
      [1,2,3,4,5,8]

  """
  def tail_recursive_sort(list = []) do
    list
  end

  def tail_recursive_sort(list = [head | _tail]) do
    # works as the "partition" part of the algorithm
    {left, right} =
      Enum.split_with(list, fn x ->
        x < head
      end)

    [smallest | rest] = tail_recursive_sort(left) ++ right
    [smallest | tail_recursive_sort(rest)]
  end
end
