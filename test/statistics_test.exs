defmodule StatisticsAlgorithmsTests do
  alias Algorithms.Statistics.MinMax, as: MinMax
  use ExUnit.Case, async: true
  @inputListNonNegative [5, 8, 1, 6, 9, 521, 10, 55, 0, 88]
  @inputList [5, 8, 1, 6, 9, -99, 10, 55, 88, -5, -20]
  doctest Algorithms

  test "Should get minimum from a non negative list" do
    assert MinMax.getMinimum(@inputListNonNegative) == 0
  end

  test "Should get minimum from a list" do
    assert MinMax.getMinimum(@inputList) == -99
  end

  test "Should get maximum from a non negative list" do
    assert MinMax.getMaximum(@inputListNonNegative) == 521
  end

  test "Should get maximum from a list" do
    assert MinMax.getMaximum(@inputList) == 88
  end

  test "Should get maximum and minimum from a non negative list" do
    minMaxMap = MinMax.getMinimumAndMaximum(@inputListNonNegative)
    assert minMaxMap[:max] == 521
    assert minMaxMap[:min] == 0
  end

  test "Should get maximum and minimum from a list" do
    minMaxMap = MinMax.getMinimumAndMaximum(@inputList)
    assert minMaxMap[:max] == 88
    assert minMaxMap[:min] == -99
  end
end