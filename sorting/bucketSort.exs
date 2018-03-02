#dont forget to compite InsertionSort

defmodule BucketSort do
  @moduledoc """
    Sorts a list with bucket sorts
    Uses the InsertionSort Module
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
        Enum.concat(InsertionSort.crescent(Enum.at(buckets, i)), tempList)
      end)
  end
end

defmodule Main do
  def main do
    inputList = [4, 1, 3, 2, 16, 9, 200, 10, 14, 8, 7, 100]
    IO.puts(inspect(inputList))
    sortedList = BucketSort.sort(inputList, 10, 1)
    IO.puts(inspect(sortedList))
  end
end

Main.main