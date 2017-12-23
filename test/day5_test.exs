defmodule AdventOfCode2017.Day5Test do
  use ExUnit.Case
  doctest AdventOfCode2017.Day5

  describe "steps_to_exit/1" do
    test "with string input that takes 5 steps to exit" do
      instructions = "0\n3\n0\n1\n-3\n"
      assert AdventOfCode2017.Day5.steps_to_exit(instructions) == 5
    end

    test "with input that takes 5 steps to exit" do
      instructions = [0, 3, 0, 1, -3]
      assert AdventOfCode2017.Day5.steps_to_exit(instructions) == 5
    end
  end

  describe "steps_to_exit_stranger/1" do
    test "with string input that takes 10 steps to exit" do
      instructions = "0\n3\n0\n1\n-3\n"
      assert AdventOfCode2017.Day5.steps_to_exit_stranger(instructions) == 10
    end

    test "with input that takes 10 steps to exit" do
      instructions = [0, 3, 0, 1, -3]
      assert AdventOfCode2017.Day5.steps_to_exit_stranger(instructions) == 10
    end
  end
end
