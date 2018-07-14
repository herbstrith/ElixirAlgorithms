defmodule Algorithms.DP.MatrixChainMultiplication do
  def matrix_chain_order(dims) do
    n = tuple_size(dims) - 1
    m = List.duplicate(List.duplicate(0, n + 1) |> List.to_tuple(), n + 1) |> List.to_tuple()
    {n, m, _dims} = Enum.reduce(1..(n - 1), {n, m, dims}, &memoized_matrix_chain_order/2)
    max_value_line = elem(m, 0)
    elem(max_value_line, n - 1)
  end

  defp memoized_matrix_chain_order(actual_length, {n, m, dims}) do
    {n, m, _actual_length, _dims} =
      Enum.reduce(
        0..(n - actual_length - 1),
        {n, m, actual_length, dims},
        &memoized_matrix_chain_order_lines_iteration/2
      )

    {n, m, dims}
  end

  defp memoized_matrix_chain_order_lines_iteration(i, {n, m, actual_length, dims}) do
    j = i + actual_length
    m = Algorithms.Util.TupleMatrix.put(m, i, j, 99_999_999)

    {n, m, _actual_length, _i, _j, _dims} =
      Enum.reduce(
        i..(j - 1),
        {n, m, actual_length, i, j, dims},
        &memoized_matrix_chain_order_columns_iteration/2
      )

    {n, m, actual_length, dims}
  end

  defp memoized_matrix_chain_order_columns_iteration(k, {n, m, actual_length, i, j, dims}) do
    value = Algorithms.Util.TupleMatrix.get(m, i, k)
    diagonalValue = Algorithms.Util.TupleMatrix.get(m, k + 1, j)
    cost = value + diagonalValue + elem(dims, i) * elem(dims, k + 1) * elem(dims, j + 1)
    actual_value = Algorithms.Util.TupleMatrix.get(m, i, j)

    if cost < actual_value do
      m = Algorithms.Util.TupleMatrix.put(m, i, j, cost)
      {n, m, actual_length, i, j, dims}
    else
      {n, m, actual_length, i, j, dims}
    end
  end
end
