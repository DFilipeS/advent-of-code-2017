defmodule AdventOfCode2017.Day8Test do
  use ExUnit.Case
  doctest AdventOfCode2017.Day8

  describe "Day 8 Part 1 largest_value/1" do
    test "with example input returns 1" do
      input = """
      b inc 5 if a > 1
      a inc 1 if b < 5
      c dec -10 if a >= 1
      c inc -20 if c == 10
      """
      assert AdventOfCode2017.Day8.largest_value(input) == 1
    end

    test "with example input returns 4416" do
      input = File.read!("day8_input.txt")
      assert AdventOfCode2017.Day8.largest_value(input) == 4416
    end
  end

  describe "Day 8 Part 2 max_value/1" do
    test "with example input returns 1" do
      input = """
      b inc 5 if a > 1
      a inc 1 if b < 5
      c dec -10 if a >= 1
      c inc -20 if c == 10
      """
      assert AdventOfCode2017.Day8.max_value(input) == 10
    end

    test "with example input returns 5199" do
      input = File.read!("day8_input.txt")
      assert AdventOfCode2017.Day8.max_value(input) == 5199
    end
  end
end
