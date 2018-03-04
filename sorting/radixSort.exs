defmodule RadixSort do
  @moduledoc """
    Sorts a list of non-negative numbers
    using radix sort algorithm
  """
  def sort(list = []) do
    list
  end

  def sort(list) do
    sort(list, 10)
  end

  defp sort(list, base) do
    max = Enum.max_by(list, &abs(&1))
    sort(list, base, max, 1)
  end

  defp sort(list, base, max, m) do
    if (max < m) do
      list
    else
      # buckets as equal to the number of digits of our base
      baseBuckets = List.duplicate([], base)
      digitsBucket = Enum.reduce(
        list,
        baseBuckets,
        fn (element, tempList) ->
          digit = div(element, m)
          digit = rem(digit, base)
          List.update_at(tempList, digit, fn(_)-> [element|Enum.at(tempList, digit)] end )
        end)
      partiallySortedList = Enum.reduce(
        (base-1)..0,
        [],
        fn(i, tempList) ->
          Enum.reverse(Enum.at(digitsBucket, i), tempList)
        end)
      sort(partiallySortedList, base, max, m*base)
    end
  end
end