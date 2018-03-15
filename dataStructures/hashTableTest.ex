ExUnit.start()

defmodule  HashTableTests do
  use ExUnit.Case, async: true

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

  test "Should insert and then search in a HashTable in multiple HashEntries" do
    hashTable = %HashTable{}
    hashTable = HashTable.insert(hashTable, 5) |> HashTable.insert(7) |> HashTable.insert(29)
    IO.puts(inspect(hashTable))
    assert map_size(hashTable.table) == 3
  end

  test "Should insert and then search in a HashTable in same HashEntries" do
    hashTable = %HashTable{}
    hashTable = HashTable.insert(hashTable, 5) |> HashTable.insert(10) |> HashTable.insert(29)
    IO.puts(inspect(hashTable))
    assert map_size(hashTable.table) == 2
  end

end