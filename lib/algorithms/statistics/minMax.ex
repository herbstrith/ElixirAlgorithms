defmodule Algorithms.Statistics.MinMax do
  def getMinimum(_list = [head|tail]) do
    getComparisonResult(tail, head, fn (x, y) ->
      case x < y do
        true -> x
        false -> y
      end
    end)
  end

  def getMaximum(_list = [head|tail]) do
    getComparisonResult(tail, head, fn (x, y) ->
      case x > y do
        true -> x
        false -> y
      end
    end)
  end

  def getMinimumAndMaximum(_list = [head|tail]) do
    getComparisonResult(tail, %{min: head, max: head}, fn (x, y) -> 
      y = case x < y[:min] do
          true -> %{y | :min => x}
          false -> y
      end
      y = case x > y[:max] do
          true -> %{y | :max => x}
          false -> y
      end
      y
    end)
  end

  defp getComparisonResult(_list = [head|tail], result, comparison) do
    result = comparison.(head, result)
    getComparisonResult(tail, result, comparison)
  end

  defp getComparisonResult(_list = [], result, _comparison) do
    result
  end
end