defmodule Algorithms.DP.LongestCommonSubsequenceTest do
  alias Algorithms.DP.LongestCommonSubsequence, as: LongestCommonSubsequence

  use ExUnit.Case, async: true

  test "Should get LCS for the strings AGGTAB and GXTXAYB" do
    assert LongestCommonSubsequence.lcs("AGGTAB", "GXTXAYB") == 4
  end

end
