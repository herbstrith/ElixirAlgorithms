defmodule Algorithms.Greedy.ActivitySelector do

  def select_activities(activies) do
    sorted_activities = Enum.sort_by( activies, & &1[:finish] )
    start = Enum.map(sorted_activities, & %{start: &1[:start], id: &1[:id]})
    finish = Enum.map(sorted_activities, & %{finish: &1[:finish], id: &1[:id]} )
    select_activities(start, finish)
  end

  def select_activities(s, f) do
    s = List.to_tuple([%{start: 0, id: -999}|s])
    f = List.to_tuple([%{finish: 0, id: -999}|f])
    n = tuple_size(s) - 2
    recursive_select_activities(s, f, 0, n)
  end

  defp recursive_select_activities(s, f, k, n) do
    m = k + 1
    m = find_first_activity(s, f, k, n, m)
    if (m - 1) <= n do
      [elem(s, m )[:id] | recursive_select_activities(s, f, m, n)]
    else
      []
    end
  end

  defp find_first_activity(s, f, k, n, m) do
    if (m - 1) <= n && (elem(s, m)[:start] < elem(f, k)[:finish]) do
      find_first_activity(s, f, k, n, m + 1)
    else
      m
    end
  end
end
