defmodule Algorithms.DataStructures.HashTableTests do
  alias Algorithms.DataStructures.HashTable, as: HashTable
  use ExUnit.Case, async: true

  test "Should create a empty HashTable" do
    hash_table = %HashTable{}
    assert map_size(hash_table.table) == 0
  end

  test "Should Insert in a HashTable (default mod hash function)" do
    hash_table = %HashTable{}
    hash_table = HashTable.insert(hash_table, 5)
    assert map_size(hash_table.table) == 1
  end

  test "Should insert and then search in a HashTable" do
    hash_table = %HashTable{}
    hash_table = HashTable.insert(hash_table, 5)
    element = HashTable.search(hash_table, 5)
    assert element == 5
  end

  test "Should delete and then search in a HashTable" do
    hash_table = %HashTable{}
    hash_table = HashTable.insert(hash_table, 5)
    hash_table = HashTable.delete(hash_table, 5)
    element = HashTable.search(hash_table, 5)
    assert element == nil
  end

  test "Should insert and then search in a HashTable with multiple HashEntries" do
    hash_table = %HashTable{}
    hash_table = HashTable.insert(hash_table, 5) |> HashTable.insert(7) |> HashTable.insert(29)
    assert map_size(hash_table.table) == 3
  end

  test "Should insert and then search in a HashTable with multiple entries in same HashEntry" do
    hash_table = %HashTable{}
    hash_table = HashTable.insert(hash_table, 5) |> HashTable.insert(10) |> HashTable.insert(29)
    assert map_size(hash_table.table) == 2
  end

  test "Should create a empty HashTable (multiplicative hash function)" do
    hash_table = %HashTable{hash_function_selector: :multiplication, hash_function_parameter: 4}
    assert map_size(hash_table.table) == 0
  end

  test "Should Insert in a HashTable (multiplicative hash function)" do
    hash_table = %HashTable{hash_function_selector: :multiplication, hash_function_parameter: 4}
    hash_table = HashTable.insert(hash_table, 5)
    assert map_size(hash_table.table) == 1
  end

  test "Should insert and then search in a HashTable(multiplicative hash function)" do
    hash_table = %HashTable{hash_function_selector: :multiplication, hash_function_parameter: 4}
    hash_table = HashTable.insert(hash_table, 5)
    element = HashTable.search(hash_table, 5)
    assert element == 5
  end

  test "Should delete and then search in a HashTable(multiplicative hash function)" do
    hash_table = %HashTable{hash_function_selector: :multiplication, hash_function_parameter: 4}
    hash_table = HashTable.insert(hash_table, 5)
    hash_table = HashTable.delete(hash_table, 5)
    element = HashTable.search(hash_table, 5)
    assert element == nil
  end

  test "Should insert and then search in a HashTable with multiple HashEntries(multiplicative hash function)" do
    hash_table = %HashTable{hash_function_selector: :multiplication, hash_function_parameter: 4}
    hash_table = HashTable.insert(hash_table, 5) |> HashTable.insert(7) |> HashTable.insert(29)
    assert map_size(hash_table.table) == 2
    element = HashTable.search(hash_table, 7)
    assert element == 7
  end

  test "Should insert and then search in a HashTable with multile values in a HashEntry(multiplicative hash function)" do
    hash_table = %HashTable{hash_function_selector: :multiplication, hash_function_parameter: 4}
    hash_table = HashTable.insert(hash_table, 5) |> HashTable.insert(10) |> HashTable.insert(29)
    assert map_size(hash_table.table) == 1
    element = HashTable.search(hash_table, 5)
    assert element == 5
  end
end
