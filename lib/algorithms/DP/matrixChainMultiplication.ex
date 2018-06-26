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
    line = elem(m,i)
    row = put_elem(line, j, 99999999)
    m = put_elem(m, i, row)
    {n , m, _actualLength, _i, _j, _dims} = Enum.reduce(
      i..(j - 1),
      {n, m, actualLength, i, j, dims},
      &memoizedMatrixChainOrderColumnsIteration/2)
    {n, m, actualLength, dims}
  end

  defp memoizedMatrixChainOrderColumnsIteration(k, {n, m, actualLength, i, j, dims}) do
    line = elem(m, i)
    value = elem(line, k)
    diagonalLine = elem(m, k + 1)
    diagonalValue = elem(diagonalLine, j)
    cost = value + diagonalValue + elem(dims, i) * elem(dims, k+1) * elem(dims, j+1)
    actualLine = elem(m, i)
    actualValue =  elem(actualLine, j)
    if (cost < actualValue) do
      actualEditedRow = put_elem(actualLine, j, cost)
      m = put_elem(m, i, actualEditedRow)
      {n , m, actualLength, i, j, dims}
    else
      {n , m, actualLength, i, j, dims}
    end
  end

end
