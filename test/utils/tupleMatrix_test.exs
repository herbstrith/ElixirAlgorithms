defmodule Algorithms.Util.TupleMatrixTest do
  alias Algorithms.Util.TupleMatrix, as: TupleMatrix

  use ExUnit.Case, async: true

  test "Should get from a tuple matrix" do
    test_matrix = {{1, 2, 3, 4}, {5, 6, 7, 8}}
    assert TupleMatrix.get(test_matrix, 0, 0) == 1
    assert TupleMatrix.get(test_matrix, 0, 1) == 2
    assert TupleMatrix.get(test_matrix, 0, 2) == 3
    assert TupleMatrix.get(test_matrix, 0, 3) == 4
    assert TupleMatrix.get(test_matrix, 1, 0) == 5
    assert TupleMatrix.get(test_matrix, 1, 1) == 6
    assert TupleMatrix.get(test_matrix, 1, 2) == 7
    assert TupleMatrix.get(test_matrix, 1, 3) == 8
  end

  test "Should put in a tuple matrix" do
    test_matrix = {{0, 0, 0}, {1, 2}}
    test_matrix = TupleMatrix.put(test_matrix, 0, 0, 1)
    assert TupleMatrix.get(test_matrix, 0, 0) == 1
    test_matrix = TupleMatrix.put(test_matrix, 0, 1, 2)
    assert TupleMatrix.get(test_matrix, 0, 1) == 2
    test_matrix = TupleMatrix.put(test_matrix, 1, 1, 9)
    assert TupleMatrix.get(test_matrix, 1, 1) == 9
  end
end
