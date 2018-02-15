inputList = [10, 20, 31, 5, 8, 9, 7, 12 ,11]
defmodule MergeSort do
 #module call
 #it does not do in place sorting
 def mergesort(list) do
   listLength = length(list)
   if (listLength < 2) do
     list
   else
     {left, right} = Enum.split(list, div(listLength, 2))
     merge(mergesort(left), mergesort(right))
   end
 end

 defp merge(_left = [], right) do
   right
 end

 defp merge(left, _right = []) do
   left
 end

 defp merge(left=[lhead|ltail], right=[rhead|rtail]) do
   if (lhead < rhead) do
     [lhead|merge(ltail, right)]
   else
     [rhead|merge(left,rtail)]
   end
 end

end

IO.puts(inspect(inputList, charlists: :as_lists))
outputList = MergeSort.mergesort(inputList)
IO.puts(inspect(outputList, charlists: :as_lists))