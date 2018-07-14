defmodule Algorithms.DP.RodCutting do
  def cut_rod(prices, n) when tuple_size(prices) >= n do
    r = List.duplicate(0, n) |> List.to_tuple()
    {_best_prices_list, best_price, _prices} = memoized_cut_rod(r, prices, n)
    best_price
  end

  def memoized_cut_rod(r, prices, n) do
    cond do
      n == 0 ->
        {r, 0, prices}

      elem(r, n - 1) != 0 ->
        {r, elem(r, n - 1), prices}

      true ->
        {r, max_val, prices, _n} = Enum.reduce(1..n, {r, -9999, prices, n}, &memoized_cut_rod_aux/2)
        r = put_elem(r, n - 1, max_val)
        {r, max_val, prices}
    end
  end

  defp memoized_cut_rod_aux(i, {r, previous_val, prices, n}) do
    {r, max_val, prices} = memoized_cut_rod(r, prices, n - i)
    max_val = Kernel.max(previous_val, elem(prices, i - 1) + max_val)
    {r, max_val, prices, n}
  end
end
