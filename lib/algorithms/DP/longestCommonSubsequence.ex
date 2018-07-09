defmodule Algorithms.DP.LongestCommonSubsequence do

  def lcs(stringA, stringB) do
    m = String.length(stringA);
    n = String.length(stringB);
    getlcs(stringA, stringB, m, n);
  end

  defp getlcs(stringA, stringB, m, n) do
    result_matrix = List.duplicate(
      List.duplicate(0, n+1) |> List.to_tuple(),
      m+1) |> List.to_tuple()
     { _m, _n, result_matrix , _stringA, _stringB } = Enum.reduce(
      0..(m),
      { m, n, result_matrix, stringA, stringB },
      &outerLoop/2)
      line = elem(result_matrix, m)
      elem(line, n)
  end

  defp outerLoop(i, {m, n, result_matrix, stringA, stringB}) do
   { _i, m, n, result_matrix , stringA, stringB } = Enum.reduce(
      0..(n),
      {i, m, n, result_matrix, stringA, stringB},
      &innerLoop/2)
    {m, n, result_matrix , stringA, stringB }
  end

  defp innerLoop(j, {i, m, n, result_matrix, stringA, stringB}) do
    cond do
      i == 0 || j == 0 ->
        result_matrix = Algorithms.Util.TupleMatrix.put(result_matrix, i, j, 0)
        { i, m, n, result_matrix, stringA, stringB }
      String.at(stringA, i - 1) == String.at(stringB, j - 1) ->
        new_value = Algorithms.Util.TupleMatrix.get(result_matrix, i-1, j-1) + 1
        result_matrix = Algorithms.Util.TupleMatrix.put(result_matrix, i, j, new_value)
        { i, m, n, result_matrix, stringA, stringB }
      true ->
        value_back = Algorithms.Util.TupleMatrix.get(result_matrix, i - 1, j)
        value_up = Algorithms.Util.TupleMatrix.get(result_matrix, i, j-1)
        new_value = max(value_up, value_back)
        result_matrix = Algorithms.Util.TupleMatrix.put(result_matrix, i, j, new_value)
        { i, m, n, result_matrix, stringA, stringB }
    end

  end
end
