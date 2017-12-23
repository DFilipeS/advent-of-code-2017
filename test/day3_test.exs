defmodule AdventOfCode2017.Day3Test do
  use ExUnit.Case
  doctest AdventOfCode2017.Day3

  describe "Day 3 Part 1 distance/1" do
    test "with input 0 returns 0" do
      assert AdventOfCode2017.Day3.distance(0) == 0
    end

    test "with input 11 returns 3" do
      assert AdventOfCode2017.Day3.distance(11) == 3
    end

    test "with input 22 returns 2" do
      assert AdventOfCode2017.Day3.distance(22) == 2
    end

    test "with input 1023 returns 31" do
      assert AdventOfCode2017.Day3.distance(1023) == 31
    end
  end

  describe "Day 3 Part 2 next_larger_than/1" do
    test "with input 1 returns 2" do
      assert AdventOfCode2017.Day3.next_larger_than(1) == 2
    end

    test "with input 2 returns 4" do
      assert AdventOfCode2017.Day3.next_larger_than(2) == 4
    end

    test "with input 3 returns 4" do
      assert AdventOfCode2017.Day3.next_larger_than(3) == 4
    end

    test "with input 10 returns 11" do
      assert AdventOfCode2017.Day3.next_larger_than(10) == 11
    end

    test "with input 125 returns 133" do
      assert AdventOfCode2017.Day3.next_larger_than(125) == 133
    end

    test "with input 361527 returns 363010" do
      assert AdventOfCode2017.Day3.next_larger_than(361527) == 363010
    end
  end
end
