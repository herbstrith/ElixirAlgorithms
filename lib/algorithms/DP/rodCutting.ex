defmodule Algorithms.DP.RodCutting do
  def cutRod(prices, n) when tuple_size(prices) >= n do
    r = List.duplicate(0, n) |> List.to_tuple()
    {_bestPricesList, bestPrice, _prices} = memoizedCutRod(r, prices, n)
    bestPrice
  end

  def memoizedCutRod(r, prices, n ) do
    cond do
      n == 0 -> {r, 0, prices}
      elem(r, n-1) != 0 -> {r, elem(r, n-1), prices}
      true ->
        {r, max_val, prices, _n} = Enum.reduce(1..n, {r, -9999, prices, n}, &memoizedCutRodAux/2)
        r = put_elem(r, n-1, max_val)
        {r, max_val, prices}
    end
  end

  defp memoizedCutRodAux(i, {r, previous_val, prices, n}) do
    {r, max_val, prices} = memoizedCutRod(r, prices, n - i)
    max_val = Kernel.max(previous_val, elem(prices, i-1) + max_val)
    {r, max_val, prices, n}
  end


end
