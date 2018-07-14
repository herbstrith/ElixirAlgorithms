defmodule Algorithms.DataStructures.HashTable do
  alias Algorithms.DataStructures.HashTable, as: HashTable
  defstruct table: %{}, hash_function_selector: :mod, hash_function_parameter: 10

  def insert(hash_table, element) do
    hash_function = get_hash_function(hash_table)

    %HashTable{
      table: Map.update(hash_table.table, hash_function.(element), [element], &[element | &1]),
      hash_function_selector: hash_table.hash_function_selector,
      hash_function_parameter: hash_table.hash_function_parameter
    }
  end

  def delete(hash_table, element) do
    hash_function = get_hash_function(hash_table)
    alteredHashEntry = hash_table.table[hash_function.(element)] |> List.delete(element)

    %HashTable{
      table: Map.put(hash_table.table, hash_function.(element), alteredHashEntry),
      hash_function_selector: hash_table.hash_function_selector,
      hash_function_parameter: hash_table.hash_function_parameter
    }
  end

  def search(hash_table, element) do
    hash_function = get_hash_function(hash_table)
    Map.get(hash_table.table, hash_function.(element), []) |> Enum.find(&(&1 == element))
  end

  defp get_hash_function(hash_table) do
    case hash_table.hash_function_selector do
      :mod -> &mod_hash(&1, hash_table.hash_function_parameter)
      :multiplication -> &multiplication_hash(&1, hash_table.hash_function_parameter)
    end
  end

  defp mod_hash(element, hashMod) do
    rem(hashMod, element)
  end

  defp multiplication_hash(element, m) do
    constant = 0.8
    multiplied = element * constant
    Kernel.trunc(m * (multiplied - Float.floor(multiplied)))
  end
end
