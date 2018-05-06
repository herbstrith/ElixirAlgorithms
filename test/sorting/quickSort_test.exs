defmodule Algorithms.Sorting.QuickSortTests do
  alias Algorithms.Sorting.QuickSort, as: QuickSort

  use ExUnit.Case, async: true

  @inputList1 [4, 1, 3, 2, 0, 16, 9, 200, 10, 14, 8, 7, 100]
  @inputList2 [4, 1, -1, 0, -35, 40, -80, 3, 2, 16, 9, 200, 10, 14, 8, 7, 100]
  @sortedList1 [0, 1, 2, 3, 4, 7, 8, 9, 10, 14, 16, 100, 200]
  @sortedList2 [-80, -35, -1, 0, 1, 2, 3, 4, 7, 8, 9, 10, 14, 16, 40, 100, 200]

  test "Sort a list with QuickSort" do
    assert QuickSort.sort(@inputList1) == @sortedList1
    assert QuickSort.sort(@inputList2) == @sortedList2
  end

end
