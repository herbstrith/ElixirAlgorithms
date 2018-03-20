defmodule Algorithms.Sorting.BucketSort do
  @moduledoc """
    Sorts a list of non-negative numbers with bucket sort
    Uses the InsertionSort Module

    Pros of bucket sort:
      O(n) complexity

    Cons of bucket sort:
      efficiency is relative to the choice of the buckets

  """

   @doc """
    Returns the sorted given 'list'

    ## Examples


      iex> Algorithms.Sorting.BucketSort.sort([1,5,4,8,3,2])
      [1,2,3,4,5,8]

  """
  def sort(list = [], _base, _multiplier) do
    list
  end

  def sort(list, base, multiplier) do
    baseBuckets = List.duplicate([], base)
    buckets = Enum.reduce(
      list,
      baseBuckets,
      fn (element, tempList) ->
        digit = div(element, base * multiplier)
        digit = case digit >= base do
          true -> base - 1
          false -> digit
        end
        List.update_at(tempList, digit, fn(_)-> [element|Enum.at(tempList, digit)] end )
      end)
    Enum.reduce(
      (base-1)..0,
      [],
      fn(i, tempList) ->
        #return sorted bucket
        Enum.concat(Algorithms.Sorting.InsertionSort.sort(Enum.at(buckets, i)), tempList)
      end)
  end
end