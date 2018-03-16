defmodule HashTable do
defstruct table: %{}, hashFunctionSelector: :mod, hashFunctionParameter: 10
 def insert(hashTable, element) do
   hashFunction = getHashFunction(hashTable)
   %HashTable{
     table: Map.update(hashTable.table, hashFunction.(element), [element], &([element|&1])),
     hashFunctionSelector: hashTable.hashFunctionSelector,
     hashFunctionParameter: hashTable.hashFunctionParameter
   }
 end

 def delete(hashTable, element) do
   hashFunction = getHashFunction(hashTable)
   alteredHashEntry = hashTable.table[hashFunction.(element)]|>List.delete(element)
   %HashTable{
     table: Map.put(hashTable.table, hashFunction.(element), alteredHashEntry),
     hashFunctionSelector: hashTable.hashFunctionSelector,
     hashFunctionParameter: hashTable.hashFunctionParameter
   }
 end

 def search(hashTable, element) do
   hashFunction = getHashFunction(hashTable)
   Map.get(hashTable.table, hashFunction.(element), []) |> Enum.find(&(&1 == element))
 end

 defp getHashFunction(hashTable) do
   case hashTable.hashFunctionSelector do
     :mod -> &modHash(&1, hashTable.hashFunctionParameter)
   end
 end

 defp modHash(element, hashMod) do
   rem(hashMod, element)
 end
end