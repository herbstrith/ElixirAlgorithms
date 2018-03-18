defmodule HashTableTests do
  alias Algorithms.DataStructures.HashTable, as: HashTable
  use ExUnit.Case, async: true
  doctest Algorithms

  test "Should create a empty HashTable" do
    hashTable = %HashTable{}
    assert map_size(hashTable.table) == 0
  end

  test "Should Insert in a HashTable (default mod hash function)" do
    hashTable = %HashTable{}
    hashTable = HashTable.insert(hashTable, 5)
    assert map_size(hashTable.table) == 1
  end

  test "Should insert and then search in a HashTable" do
    hashTable = %HashTable{}
    hashTable = HashTable.insert(hashTable, 5)
    element = HashTable.search(hashTable, 5)
    assert element == 5
  end

  test "Should delete and then search in a HashTable" do
    hashTable = %HashTable{}
    hashTable = HashTable.insert(hashTable, 5)
    hashTable = HashTable.delete(hashTable, 5)
    element = HashTable.search(hashTable, 5)
    assert element == nil
  end

  test "Should insert and then search in a HashTable with multiple HashEntries" do
    hashTable = %HashTable{}
    hashTable = HashTable.insert(hashTable, 5) |> HashTable.insert(7) |> HashTable.insert(29)
    assert map_size(hashTable.table) == 3
  end

  test "Should insert and then search in a HashTable with multiple entries in same HashEntry" do
    hashTable = %HashTable{}
    hashTable = HashTable.insert(hashTable, 5) |> HashTable.insert(10) |> HashTable.insert(29)
    assert map_size(hashTable.table) == 2
  end

  test "Should create a empty HashTable (multiplicative hash function)" do
    hashTable = %HashTable{hashFunctionSelector: :multiplication, hashFunctionParameter: 4}
    assert map_size(hashTable.table) == 0
  end

  test "Should Insert in a HashTable (multiplicative hash function)" do
    hashTable = %HashTable{hashFunctionSelector: :multiplication, hashFunctionParameter: 4}
    hashTable = HashTable.insert(hashTable, 5)
    assert map_size(hashTable.table) == 1
  end

  test "Should insert and then search in a HashTable(multiplicative hash function)" do
    hashTable = %HashTable{hashFunctionSelector: :multiplication, hashFunctionParameter: 4}
    hashTable = HashTable.insert(hashTable, 5)
    element = HashTable.search(hashTable, 5)
    assert element == 5
  end

  test "Should delete and then search in a HashTable(multiplicative hash function)" do
    hashTable = %HashTable{hashFunctionSelector: :multiplication, hashFunctionParameter: 4}
    hashTable = HashTable.insert(hashTable, 5)
    hashTable = HashTable.delete(hashTable, 5)
    element = HashTable.search(hashTable, 5)
    assert element == nil
  end

  test "Should insert and then search in a HashTable with multiple HashEntries(multiplicative hash function)" do
    hashTable = %HashTable{hashFunctionSelector: :multiplication, hashFunctionParameter: 4}
    hashTable = HashTable.insert(hashTable, 5) |> HashTable.insert(7) |> HashTable.insert(29)
    assert map_size(hashTable.table) == 2
    element = HashTable.search(hashTable, 7)
    assert element == 7
  end

  test "Should insert and then search in a HashTable with multile values in a HashEntry(multiplicative hash function)" do
    hashTable = %HashTable{hashFunctionSelector: :multiplication, hashFunctionParameter: 4}
    hashTable = HashTable.insert(hashTable, 5) |> HashTable.insert(10) |> HashTable.insert(29)
    assert map_size(hashTable.table) == 1
    element = HashTable.search(hashTable, 5)
    assert element == 5
  end

end