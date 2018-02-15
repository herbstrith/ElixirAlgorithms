inputList = [10, 20, 31, 5, 8, 9, 7, 12 ,11]

defmodule InsertionSort do
  #method call
  def crescent(list) do
    crescent([hd(list)], tl(list))
  end

  # the last case of the recursion
  defp crescent(outputList, _inputList = []) do
    outputList
  end
  # the "average" case when both lists have entries on them, input list must not be empty
  defp crescent(outputList, inputList = [head|tail]) do
    insertCrescent(head, outputList) |> crescent(tail)
  end

  # when the output list is empty we just return the element
  defp insertCrescent(actualElement, _outputList = []) do
    [actualElement]
  end
  # Inserts the element in outputList
  defp insertCrescent(actualElement, outputList = [head|tail]) do
    if (head >= actualElement) do
      [actualElement|[head|tail]]
    else
      [head|insertCrescent(actualElement, tail)]
    end
  end

end

IO.puts(inspect(inputList))
outputList = InsertionSort.crescent(inputList)
IO.puts(inspect(outputList))