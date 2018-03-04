ExUnit.start()

defmodule SortAlgorithmTests do
    use ExUnit.Case, async: true

    @inputList1 [4, 1, 3, 2, 0, 16, 9, 200, 10, 14, 8, 7, 100]
    @inputList2 [4, 1, -1, 0, -35, 40, -80, 3, 2, 16, 9, 200, 10, 14, 8, 7, 100]
    @sortedList1 [0, 1, 2, 3, 4, 7, 8, 9, 10, 14, 16, 100, 200]
    @sortedList2 [-80, -35, -1, 0, 1, 2, 3, 4, 7, 8, 9, 10, 14, 16, 40, 100, 200]
  
    test "Sort a list with InsertionSort" do
        assert InsertionSort.sort(@inputList1) == @sortedList1
        assert InsertionSort.sort(@inputList2) == @sortedList2
    end

    test "Sort a list with MergeSort" do
      assert MergeSort.sort(@inputList1) == @sortedList1
      assert MergeSort.sort(@inputList2) == @sortedList2
    end

    test "Sort a list with QuickSort" do
      assert QuickSort.sort(@inputList1) == @sortedList1
      assert QuickSort.sort(@inputList2) == @sortedList2
    end

    test "Sort a list with HeapSort" do
      assert HeapSort.sort(@inputList1) == @sortedList1
      assert HeapSort.sort(@inputList2) == @sortedList2
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