defmodule Algorithms.DP.MatrixChainMultiplication do

  def matrixChainOrder(dims) do
    n = tuple_size(dims) - 1
    m = List.duplicate(
      List.duplicate(0, n+1) |> List.to_tuple(),
      n+1) |> List.to_tuple()
    { n, m, _dims } = Enum.reduce(
      1..(n - 1),
      {n, m, dims},
      &memoizedMatrixChainOrder/2)
    maxValueLine = elem(m, 0)
    elem(maxValueLine, n-1)
  end

  defp memoizedMatrixChainOrder(actualLength, {n, m, dims}) do
    {n, m, _actualLength, _dims} = Enum.reduce(
      0..(n - actualLength - 1),
      {n, m, actualLength, dims},
      &memoizedMatrixChainOrderLinesIteration/2)
    {n, m, dims}
  end

  defp memoizedMatrixChainOrderLinesIteration(i, {n, m, actualLength, dims}) do
    j = i + actualLength
    m = Algorithms.Util.TupleMatrix.put(m, i, j, 99999999)
    {n , m, _actualLength, _i, _j, _dims} = Enum.reduce(
      i..(j - 1),
      {n, m, actualLength, i, j, dims},
      &memoizedMatrixChainOrderColumnsIteration/2)
    {n, m, actualLength, dims}
  end

  defp memoizedMatrixChainOrderColumnsIteration(k, {n, m, actualLength, i, j, dims}) do
    value = Algorithms.Util.TupleMatrix.get(m, i, k)
    diagonalValue = Algorithms.Util.TupleMatrix.get(m, k + 1, j)
    cost = value + diagonalValue + elem(dims, i) * elem(dims, k+1) * elem(dims, j+1)
    actualValue = Algorithms.Util.TupleMatrix.get(m, i, j)
    if (cost < actualValue) do
      m = Algorithms.Util.TupleMatrix.put(m, i, j, cost)
      {n , m, actualLength, i, j, dims}
    else
      {n , m, actualLength, i, j, dims}
    end
  end

end
