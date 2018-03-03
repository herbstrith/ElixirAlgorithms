inputList = [10, 20, 31, 5, 8, 9, 7, 12 ,11]

defmodule InsertionSort do
  #method call
  def sort(list = []) do
    list
  end
  #method call
  def sort(list) do
    sort([hd(list)], tl(list))
  end

  # the last case of the recursion
  defp sort(outputList, _inputList = []) do
    outputList
  end
  # the "average" case when both lists have entries on them, input list must not be empty
  defp sort(outputList, inputList = [head|tail]) do
    insertCrescent(head, outputList) |> sort(tail)
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