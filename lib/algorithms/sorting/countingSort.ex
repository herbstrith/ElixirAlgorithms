defmodule Algorithms.Sorting.CountingSort do
  @moduledoc """
    Sorts a list of non-negative numbers using
    the counting sort algorithm

    Pros of counting sort:
      O(n+k) complexity

    Cons of counting sort:
      only works for discrete values

  """

  @doc """
    Returns the sorted given 'list'

    ## Examples


      iex> Algorithms.Sorting.CountingSort.sort([1,5,4,8,3,2])
      [1,2,3,4,5,8]

  """
  def sort(list, k) do
    count_list = count_numbers(List.duplicate(0, k + 1), list)
    count_list = count_lesser_than(count_list, count_list, 0, 0)
    sorted_list = order_list(list, count_list, list)
    sorted_list
  end

  defp order_list(output_list, count_list, _list = [head | tail]) do
    output_list = List.update_at(output_list, Enum.at(count_list, head) - 1, fn _ -> head end)
    order_list(output_list, count_list, tail)
  end

  defp order_list(output_list, _count_list, _list = []) do
    output_list
  end

  defp count_numbers(output_list, _list = [head | tail]) do
    result = List.update_at(output_list, head, &(&1 + 1))
    count_numbers(result, tail)
  end

  defp count_numbers(output_list, _list = []) do
    output_list
  end

  defp count_lesser_than(output_list, _list = [head | tail], count, index) do
    count = head + count

    result =
      List.update_at(output_list, index, fn x ->
        if x > 0 do
          count
        else
          x
        end
      end)

      count_lesser_than(result, tail, count, index + 1)
  end

  defp count_lesser_than(output_list, _list = [], _count, _index) do
    output_list
  end
end
