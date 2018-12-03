defmodule Algorithms.Greedy.ActivitySelectorTest do
  alias Algorithms.Greedy.ActivitySelector, as: ActivitySelector

  use ExUnit.Case, async: true

  test "Should select activities from a tuple list" do
    activities = [
      %{id: 0, start: 1, finish: 2 },
      %{id: 1, start: 3, finish: 4 },
      %{id: 2, start: 0, finish: 6 },
      %{id: 3, start: 5, finish: 7 },
      %{id: 4, start: 8, finish: 9 },
      %{id: 5, start: 5, finish: 9 }
    ]
    assert ActivitySelector.select_activities(activities) == [0, 1, 3, 4]
  end

  test "Should select activities from a tuple list that is not ordered by finish time" do
    activities = [
      %{id: 0, start: 0, finish: 6 },
      %{id: 1, start: 1, finish: 2 },
      %{id: 2, start: 5, finish: 9 },
      %{id: 3, start: 3, finish: 4 },
      %{id: 4, start: 5, finish: 7 },
      %{id: 5, start: 8, finish: 9 }
    ]
    assert ActivitySelector.select_activities(activities) == [1, 3, 4, 5]
  end


end
