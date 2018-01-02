defmodule AdventOfCode2017.Day10Test do

  use ExUnit.Case
  doctest AdventOfCode2017.Day10

  describe "Day 10 Part 1 multiply_first/2" do
    test "with input ([0, 1, 2, 3, 4], \"3,4,1,5\") returns 12" do
      assert AdventOfCode2017.Day10.multiply_first(Enum.into(0..4, []), "3,4,1,5") == 12
    end

    test "with example input returns 1980" do
      assert AdventOfCode2017.Day10.multiply_first(Enum.into(0..255, []), File.read!("day10_input.txt")) == 1980
    end
  end

  describe "Day 10 Part 2 knot_hash/1" do
    test "with input (\"\") returns a2582a3a0e66e6e86e3812dcb672a272" do
      assert AdventOfCode2017.Day10.knot_hash("") == "a2582a3a0e66e6e86e3812dcb672a272"
    end

    test "with input (\"AoC 2017\") returns 33efeb34ea91902bb2f59c9920caa6cd" do
      assert AdventOfCode2017.Day10.knot_hash("AoC 2017") == "33efeb34ea91902bb2f59c9920caa6cd"
    end

    test "with input (\"1,2,3\") returns 3efbe78a8d82f29979031a4aa0b16a9d" do
      assert AdventOfCode2017.Day10.knot_hash("1,2,3") == "3efbe78a8d82f29979031a4aa0b16a9d"
    end

    test "with input (\"1,2,4\") returns 63960835bcdc130f0b66d7ff4f6a5a8e" do
      assert AdventOfCode2017.Day10.knot_hash("1,2,4") == "63960835bcdc130f0b66d7ff4f6a5a8e"
    end

    test "with example input returns 899124dac21012ebc32e2f4d11eaec55" do
      assert AdventOfCode2017.Day10.knot_hash(File.read!("day10_input.txt")) == "899124dac21012ebc32e2f4d11eaec55"
    end
  end
end