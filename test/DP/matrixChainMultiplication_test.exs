defmodule Algorithms.DP.MatrixChainMultiplicationTest do
  alias Algorithms.DP.MatrixChainMultiplication, as: MatrixChainMultiplication

  use ExUnit.Case, async: true

  test "Should get best matrix number of multiplication" do
    assert MatrixChainMultiplication.matrixChainOrder({1, 2, 3, 4}) == 18
  end

end
