defmodule Algorithms.Sorting.BucketSortTest do
  alias Algorithms.Sorting.BucketSort, as: BucketSort

  use ExUnit.Case, async: true

  @inputList1 [4, 1, 3, 2, 0, 16, 9, 200, 10, 14, 8, 7, 100]
  @sortedList1 [0, 1, 2, 3, 4, 7, 8, 9, 10, 14, 16, 100, 200]

  test "Sort a list with BucketSort 1" do
      assert BucketSort.sort(@inputList1, 10, 1) == @sortedList1
  end

end
