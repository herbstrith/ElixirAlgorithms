defmodule Algorithms.DP.MatrixChainMultiplicationTest do
  alias Algorithms.DP.MatrixChainMultiplication, as: MatrixChainMultiplication

  use ExUnit.Case, async: true

  test "Should get best matrix number of multiplication from matrix with length 1, 2 ,3 and 4 " do
    assert MatrixChainMultiplication.matrix_chain_order({1, 2, 3, 4}) == 18
  end

  test "Should get best matrix number of multiplication from matrix with length 40, 20, 30, 10 and 30 " do
    assert MatrixChainMultiplication.matrix_chain_order({40, 20, 30, 10, 30}) == 26000
  end

  test "Should get best matrix number of multiplication from matrix with length 10, 20, 30, 40 and 30 " do
    assert MatrixChainMultiplication.matrix_chain_order({10, 20, 30, 40, 30}) == 30000
  end

  test "Should get best matrix number of multiplication from matrix with length 10, 20 and 30 " do
    assert MatrixChainMultiplication.matrix_chain_order({10, 20, 30}) == 6000
  end
end
