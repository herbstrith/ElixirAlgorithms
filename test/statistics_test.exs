defmodule Algorithms.Statatistics.StatisticsAlgorithmsTests do
  alias Algorithms.Statistics.MinMax, as: MinMax
  use ExUnit.Case, async: true
  @input_list_non_negative [5, 8, 1, 6, 9, 521, 10, 55, 0, 88]
  @input_list [5, 8, 1, 6, 9, -99, 10, 55, 88, -5, -20]

  test "Should get minimum from a non negative list" do
    assert MinMax.get_minimum(@input_list_non_negative) == 0
  end

  test "Should get minimum from a list" do
    assert MinMax.get_minimum(@input_list) == -99
  end

  test "Should get maximum from a non negative list" do
    assert MinMax.get_maximum(@input_list_non_negative) == 521
  end

  test "Should get maximum from a list" do
    assert MinMax.get_maximum(@input_list) == 88
  end

  test "Should get maximum and minimum from a non negative list" do
    min_max_map = MinMax.get_minimum_and_maximum(@input_list_non_negative)
    assert min_max_map[:max] == 521
    assert min_max_map[:min] == 0
  end

  test "Should get maximum and minimum from a list" do
    min_max_map = MinMax.get_minimum_and_maximum(@input_list)
    assert min_max_map[:max] == 88
    assert min_max_map[:min] == -99
  end
end
