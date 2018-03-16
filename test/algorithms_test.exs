defmodule AlgorithmsTest do
  use ExUnit.Case, async: true
  doctest Algorithms

  test "greets the world" do
    assert Algorithms.hello() == :world
  end
end
