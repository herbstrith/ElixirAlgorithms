defmodule Algorithms.Util.TupleMatrix do
  def put(tuple_matrix, pos_i, pos_j, value) do
    line_i = elem(tuple_matrix, pos_i)
    edited_line_i = put_elem(line_i, pos_j, value)
    put_elem(tuple_matrix, pos_i, edited_line_i)
  end

  def get(tuple_matrix, pos_i, pos_j) do
    line_i = elem(tuple_matrix, pos_i)
    elem(line_i, pos_j)
  end
end
