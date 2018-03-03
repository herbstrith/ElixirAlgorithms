ExUnit.start()

defmodule SortAlgorithmTests do
    use ExUnit.Case, async: true

    @inputList1 [4, 1, 3, 2, 16, 9, 200, 10, 14, 8, 7, 100]
    @sortedList1 [1, 2, 3, 4, 7, 8, 9, 10, 14, 16, 100, 200]

    test "Sort a list with InsertionSort" do
        assert InsertionSort.sort(@inputList1) == @sortedList1
    end

    test "Sort a list with MergeSort" do
      assert MergeSort.sort(@inputList1) == @sortedList1
    end

    test "Sort a list with QuickSort" do
      assert QuickSort.sort(@inputList1) == @sortedList1
    end

    test "Sort a list with HeapSort" do
      assert HeapSort.sort(@inputList1) == @sortedList1
    end

    test "Sort a list with CountingSort" do
      assert CountingSort.sort(@inputList1, 200) == @sortedList1
    end

    test "Sort a list with RadixSort" do
      assert RadixSort.sort(@inputList1) == @sortedList1
    end

    test "Sort a list with BucketSort" do
        assert BucketSort.sort(@inputList1, 10, 1) == @sortedList1
    end
end