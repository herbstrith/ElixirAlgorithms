defmodule Algorithms.Sorting.CountingSortTests do
  alias Algorithms.Sorting.CountingSort, as: CountingSort

  use ExUnit.Case, async: true

  @inputList1 [4, 1, 3, 2, 0, 16, 9, 200, 10, 14, 8, 7, 100]
  @sortedList1 [0, 1, 2, 3, 4, 7, 8, 9, 10, 14, 16, 100, 200]

  test "Sort a list with CountingSort" do
    assert CountingSort.sort(@inputList1, 200) == @sortedList1
  end

end
