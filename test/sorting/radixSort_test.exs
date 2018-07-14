defmodule Algorithms.Sorting.RadixSortTests do
  alias Algorithms.Sorting.RadixSort, as: RadixSort

  use ExUnit.Case, async: true

  @input_list1 [4, 1, 3, 2, 0, 16, 9, 200, 10, 14, 8, 7, 100]
  @sorted_list1 [0, 1, 2, 3, 4, 7, 8, 9, 10, 14, 16, 100, 200]

  test "Sort a list with RadixSort" do
    assert RadixSort.sort(@input_list1) == @sorted_list1
  end
end
