defmodule Algorithms.Statistics.MinMax do
  def get_minimum(_list = [head | tail]) do
    get_comparison_result(tail, head, fn x, y ->
      case x < y do
        true -> x
        false -> y
      end
    end)
  end

  def get_maximum(_list = [head | tail]) do
    get_comparison_result(tail, head, fn x, y ->
      case x > y do
        true -> x
        false -> y
      end
    end)
  end

  def get_minimum_and_maximum(_list = [head | tail]) do
    get_comparison_result(tail, %{min: head, max: head}, fn x, y ->
      y =
        case x < y[:min] do
          true -> %{y | :min => x}
          false -> y
        end

      y =
        case x > y[:max] do
          true -> %{y | :max => x}
          false -> y
        end

      y
    end)
  end

  defp get_comparison_result(_list = [head | tail], result, comparison) do
    result = comparison.(head, result)
    get_comparison_result(tail, result, comparison)
  end

  defp get_comparison_result(_list = [], result, _comparison) do
    result
  end
end
