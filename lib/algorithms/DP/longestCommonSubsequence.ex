defmodule Algorithms.DP.LongestCommonSubsequence do
  def lcs(string_a, string_b) do
    m = String.length(string_a)
    n = String.length(string_b)
    get_lcs(string_a, string_b, m, n)
  end

  defp get_lcs(string_a, string_b, m, n) do
    result_matrix =
      List.duplicate(List.duplicate(0, n + 1) |> List.to_tuple(), m + 1) |> List.to_tuple()
    { _m, _n, result_matrix, _string_a, _string_b } =
      Enum.reduce(0..m, {m, n, result_matrix, string_a, string_b}, &outer_loop/2)
    # lcs_string = print_lcs(result_matrix, string_a, string_b, m-1, n-1)
    line = elem(result_matrix, m)
    { elem(line, n) }
  end

  defp outer_loop(i, {m, n, result_matrix, string_a, string_b}) do
    { _i, m, n, result_matrix, string_a, string_b } =
      Enum.reduce(0..n, {i, m, n, result_matrix, string_a, string_b}, &inner_loop/2)

    { m, n, result_matrix, string_a, string_b }
  end

  defp inner_loop(j, { i, m, n, result_matrix, string_a, string_b }) do
    cond do
      i == 0 || j == 0 ->
        result_matrix = Algorithms.Util.TupleMatrix.put(result_matrix, i, j, 0)
        { i, m, n, result_matrix, string_a, string_b }

      String.at(string_a, i - 1) == String.at(string_b, j - 1) ->
        new_value = Algorithms.Util.TupleMatrix.get(result_matrix, i - 1, j - 1) + 1
        result_matrix = Algorithms.Util.TupleMatrix.put(result_matrix, i, j, new_value)
        { i, m, n, result_matrix, string_a, string_b }

      true ->
        value_back = Algorithms.Util.TupleMatrix.get(result_matrix, i - 1, j)
        value_up = Algorithms.Util.TupleMatrix.get(result_matrix, i, j - 1)
        new_value = max(value_up, value_back)
        result_matrix = Algorithms.Util.TupleMatrix.put(result_matrix, i, j, new_value)
        { i, m, n, result_matrix, string_a, string_b }
    end
  end

  # defp print_lcs(result_matrix, string_a, string_b, i, j) do
  #   cond do
  #     i == 0 || j == 0 -> ""
  #     String.at(string_a, i + 1) == String.at(string_b, j + 1) ->
  #       "#{print_lcs(result_matrix, string_a, string_b, i - 1, j - 1)}#{String.at(string_a, i + 1)}"
  #     Algorithms.Util.TupleMatrix.get(result_matrix, i, j - 1) > Algorithms.Util.TupleMatrix.get(result_matrix, i - 1, j) ->
  #       "#{print_lcs(result_matrix, string_a, string_b, i, j - 1)}"
  #     true -> "#{print_lcs(result_matrix, string_a, string_b, i - 1, j)}"
  #   end
  # end
end
