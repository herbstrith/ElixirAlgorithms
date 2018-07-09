defmodule Algorithms.DP.LongestCommonSubsequenceTest do
  alias Algorithms.DP.LongestCommonSubsequence, as: LongestCommonSubsequence

  use ExUnit.Case, async: true

  test "Should get LCS for the strings AGGTAB and GXTXAYB" do
    assert LongestCommonSubsequence.lcs("AGGTAB", "GXTXAYB") == 4
  end

  test "Should get LCS for the strings AAAAAAA and AABAAABAA" do
    assert LongestCommonSubsequence.lcs("AAAAAAA", "AABAAABAA") == 7
  end

  test "Should get LCS for the strings ' ' and AABAAABAA" do
    assert LongestCommonSubsequence.lcs("", "AABAAABAA") == 0
  end

  test "Should get LCS for two empty strings" do
    assert LongestCommonSubsequence.lcs("", "") == 0
  end

  test "Should get LCS for the strings ABCDE and FGHIJ" do
    assert LongestCommonSubsequence.lcs("ABCDE", "FGHIJ") == 0
  end

  test "Should get LCS for the strings A and CDEFABCDA" do
    assert LongestCommonSubsequence.lcs("A", "CDEFABCDA") == 1
  end

end
