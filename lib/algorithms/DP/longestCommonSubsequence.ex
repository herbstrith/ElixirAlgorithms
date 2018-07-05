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
        line = elem(result_matrix, i)
        value = 0
        actualEditedValue = put_elem(line, j, value)
        result_matrix = put_elem(result_matrix, i, actualEditedValue)
        { i, m, n, result_matrix, stringA, stringB }
      String.at(stringA, i - 1) == String.at(stringB, j - 1) ->
        line = elem(result_matrix, (i-1))
        value = elem(line, j-1) + 1
        lineToEdit = elem(result_matrix, i)
        actualEditedLine = put_elem(lineToEdit, j, value)
        result_matrix = put_elem(result_matrix, i, actualEditedLine)
        { i, m, n, result_matrix, stringA, stringB }
      true ->
        lineBack = elem(result_matrix, (i - 1))
        valueBack = elem(lineBack, j)
        lineUp = elem(result_matrix, i)
        valueUp = elem(lineUp, j - 1)
        line = elem(result_matrix, i)
        newValue = max(valueUp, valueBack)
        actualEditedValue = put_elem(line, j, newValue)
        result_matrix = put_elem(result_matrix, i, actualEditedValue)
        { i, m, n, result_matrix, stringA, stringB }
    end

  end

end
