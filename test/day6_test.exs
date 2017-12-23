defmodule AdventOfCode2017.Day6Test do
  use ExUnit.Case
  doctest AdventOfCode2017.Day6

  describe "test find_cycle/1" do
    test "with string input that takes 5 steps to detect the cycle" do
      assert AdventOfCode2017.Day6.find_cycle("0 2 7 0") == 5
    end

    test "with input that takes 5 steps to detect the cycle" do
      assert AdventOfCode2017.Day6.find_cycle([0, 2, 7, 0]) == 5
    end
  end

  describe "test find_cycle_period/1" do
    test "with string input where period of the first cycle is 4" do
      assert AdventOfCode2017.Day6.find_cycle_period("0 2 7 0") == 4
    end

    test "with input where period of the first cycle is 4" do
      assert AdventOfCode2017.Day6.find_cycle_period([0, 2, 7, 0]) == 4
    end
  end
end
