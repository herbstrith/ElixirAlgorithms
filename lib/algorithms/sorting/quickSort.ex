defmodule Algorithms.Sorting.QuickSort do
  def sort(list = []) do
    list
  end

  def sort([head | tail]) do
    # get values that are bigger than head in one list and smaller in another
    # works as the "partition" part of the algorithm
    { left, right } = Enum.split_with(
      tail,
      fn(x) -> 
        x < head
      end)
    #the two recursive calls where our "q" is defined by the head
    sort(left) ++ [head | sort(right)]
  end

  def tailRecursiveSort(list = []) do
    list
  end

  def tailRecursiveSort(list = [head | _tail]) do
    # works as the "partition" part of the algorithm
    { left, right } = Enum.split_with(
      list,
      fn(x) -> 
        x < head
      end)
    [smallest|rest] = tailRecursiveSort(left) ++ right
    [smallest|tailRecursiveSort(rest)]
  end
end