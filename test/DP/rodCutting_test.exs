defmodule Algorithms.DP.RodCuttingTest do
  alias Algorithms.DP.RodCutting, as: RodCutting

  use ExUnit.Case, async: true

  test "Should cut a rod of size 8" do
    assert RodCutting.cut_rod({1, 5, 8, 9, 10, 17, 17, 20}, 8) == 22
  end

  test "Should cut a rod of size 5" do
    assert RodCutting.cut_rod({1, 5, 8, 9, 10, 17, 17, 20}, 5) == 13
  end

  test "Should cut a rod of size 4" do
    assert RodCutting.cut_rod({1, 5, 8, 9, 10, 17, 17, 20}, 4) == 10
  end

  test "Should cut a rod of size 1" do
    assert RodCutting.cut_rod({1, 5, 8, 9, 10, 17, 17, 20}, 1) == 1
  end

  test "Should cut a rod of size 0 (return 0)" do
    assert RodCutting.cut_rod({1, 5, 8, 9, 10, 17, 17, 20}, 0) == 0
  end

  test "Should not cut a rod without a price list that matches its length" do
    assert_raise FunctionClauseError, fn -> RodCutting.cut_rod({1, 5}, 4) end
  end
end
