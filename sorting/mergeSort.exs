inputList = [10, 20, 31, 5, 8, 9, 7, 12 ,11]
defmodule MergeSort do
 #module call
 #it does not do in place sorting
 def sort(list) do
   listLength = length(list)
   if (listLength < 2) do
     list
   else
     {left, right} = Enum.split(list, div(listLength, 2))
     merge(sort(left), sort(right))
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