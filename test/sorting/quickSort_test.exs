defmodule Algorithms.Sorting.QuickSortTests do
  alias Algorithms.Sorting.QuickSort, as: QuickSort

  use ExUnit.Case, async: true

  @input_list1 [4, 1, 3, 2, 0, 16, 9, 200, 10, 14, 8, 7, 100]
  @input_list2 [4, 1, -1, 0, -35, 40, -80, 3, 2, 16, 9, 200, 10, 14, 8, 7, 100]
  @sorted_list1 [0, 1, 2, 3, 4, 7, 8, 9, 10, 14, 16, 100, 200]
  @sorted_list2 [-80, -35, -1, 0, 1, 2, 3, 4, 7, 8, 9, 10, 14, 16, 40, 100, 200]

  test "Sort a list with QuickSort" do
    assert QuickSort.sort(@input_list1) == @sorted_list1
    assert QuickSort.sort(@input_list2) == @sorted_list2
  end
end
