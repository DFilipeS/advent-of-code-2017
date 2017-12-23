defmodule AdventOfCode2017.Day4Test do
  use ExUnit.Case
  doctest AdventOfCode2017.Day4

  describe "Day 4 Part 1 count_valid/1" do
    test "with example input returns 2" do
      passphrases = """
      aa bb cc dd ee
      aa bb cc dd aa
      aa bb cc dd aaa
      """
      assert AdventOfCode2017.Day4.count_valid(passphrases) == 2
    end
  end

  describe "Day 4 Part 2 count_valid_without_anagrams" do
    test "with example input returns 3" do
      passphrases = """
      abcde fghij
      abcde xyz ecdab
      a ab abc abd abf abj
      iiii oiii ooii oooi oooo
      oiii ioii iioi iiio
      """
      assert AdventOfCode2017.Day4.count_valid_without_anagrams(passphrases) == 3
    end
  end
end
