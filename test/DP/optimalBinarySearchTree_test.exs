defmodule Algorithms.DP.OptimalBinarySearchTreeTest do
  alias Algorithms.DP.OptimalBinarySearchTree, as: OptimalBinarySearchTree

  use ExUnit.Case, async: true

  test "Should get optimal tree" do
    keys = { "", 0.15, 0.10, 0.05, 0.10, 0.20 }
    frequency = { 0.05, 0.1, 0.05, 0.05, 0.05, 0.1 }
    { _e, _root, optimal_search_cost } = OptimalBinarySearchTree.optimal_bst(keys, frequency, 5)
    assert optimal_search_cost == 2.75
  end

  test "Should get optimal tree for 7 element tree" do
    keys = { "", 0.04, 0.06, 0.08, 0.02, 0.10, 0.12, 0.14 }
    frequency = { 0.06, 0.06, 0.06, 0.06, 0.05, 0.05, 0.05, 0.05 }
    { _e, _root, optimal_search_cost } = OptimalBinarySearchTree.optimal_bst(keys, frequency, 7)
    assert optimal_search_cost == 3.12
  end
end
