defmodule Algorithms.DP.OptimalBinarySearchTree do
  alias Algorithms.Util.TupleMatrix, as: TupleMatrix

  def optimal_bst(p, q, n) do
    e = List.duplicate(List.duplicate(0, n + 1) |> List.to_tuple(), n + 2) |> List.to_tuple()
    w = List.duplicate(List.duplicate(0, n + 1) |> List.to_tuple(), n + 2) |> List.to_tuple()
    root = List.duplicate(List.duplicate(0, n + 1) |> List.to_tuple(), n + 1) |> List.to_tuple()
    { e, w } = Enum.reduce(1..n + 1, {e, w},
      fn i, {e, w} -> {
        TupleMatrix.put(e, i, i - 1, elem(q, i - 1)),
        TupleMatrix.put(w, i, i - 1, elem(q, i - 1)),
      } end )
    { e, root, _n, _p, _q, _w } = Enum.reduce(1..n, { e, root, n, p, q, w }, &first_loop/2)
    { e, root, TupleMatrix.get(e, 1, n) }
  end

  defp first_loop(l, { e, root, n, p, q, w }) do
    { e, root, n, p, q, w, _l } =
      Enum.reduce(
        1..(n - l + 1),
        { e, root, n, p, q, w, l },
        &second_loop/2
      )
    { e, root, n, p, q, w }
  end

  defp second_loop(i, { e, root, n, p, q, w, l }) do
    j = i + l - 1
    e = TupleMatrix.put(e, i, j, 99999)
    w = TupleMatrix.put(w, i, j, TupleMatrix.get(w, i, j - 1) + elem(p, j) + elem(q, j))
    { e, root, _i, _j, w } =
      Enum.reduce(
        i..j,
        { e, root, i, j, w},
        &third_loop/2
      )

      { e, root, n, p, q, w, l }
  end

  defp third_loop(r, { e, root, i, j, w }) do
    t = TupleMatrix.get(e, i, r - 1) + TupleMatrix.get(e, r + 1, j) + TupleMatrix.get(w, i, j)
    if ( t < TupleMatrix.get(e, i, j) ) do
      e = TupleMatrix.put(e, i, j, t)
      root = TupleMatrix.put(root, i, j, r)
      { e, root, i, j, w }
    else
      { e, root, i, j, w }
    end
  end

end
