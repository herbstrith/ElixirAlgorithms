defmodule CountSort do

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



defmodule Main do
  def main do
    inputList = [4, 1, 3, 2, 16, 9, 10, 14, 8, 7]
    IO.puts(inspect(inputList))
    sortedList = CountSort.sort(inputList, 16)
    IO.puts(inspect(sortedList))
  end
end

Main.main