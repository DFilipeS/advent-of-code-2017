defmodule AdventOfCode2017.Day2Test do
  use ExUnit.Case
  doctest AdventOfCode2017.Day2

  describe "Day 2 Part 1 checksum_min_max/2" do
    test "with example input returns 18" do
      input = "5 1 9 5\n7 5 3\n2 4 6 8\n"
      assert AdventOfCode2017.Day2.checksum_min_max(input, " ") == 18
    end
  end

  describe "Day 2 Part 2 checksum_divisible/2" do
    test "with example input returns 9" do
      input = "5 9 2 8\n9 4 7 3\n3 8 6 5\n"
      assert AdventOfCode2017.Day2.checksum_divisible(input, " ") == 9
    end
  end
end
