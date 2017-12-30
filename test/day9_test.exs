defmodule AdventOfCode2017.Day9Test do

  use ExUnit.Case
  doctest AdventOfCode2017.Day9

  describe "Day 9 Part 1 get_score/1" do
    test "with input {} returns 1" do
      assert AdventOfCode2017.Day9.get_score("{}") == 1
    end

    test "with input {{{}}} returns 6" do
      assert AdventOfCode2017.Day9.get_score("{{{}}}") == 6
    end

    test "with input {{},{}} returns 5" do
      assert AdventOfCode2017.Day9.get_score("{{},{}}") == 5
    end

    test "with input {{{},{},{{}}}} returns 16" do
      assert AdventOfCode2017.Day9.get_score("{{{},{},{{}}}}") == 16
    end
    
    test "with input {<a>,<a>,<a>,<a>} returns 1" do
      assert AdventOfCode2017.Day9.get_score("{<a>,<a>,<a>,<a>}") == 1
    end

    test "with input {{<ab>},{<ab>},{<ab>},{<ab>}} returns 9" do
      assert AdventOfCode2017.Day9.get_score("{{<ab>},{<ab>},{<ab>},{<ab>}}") == 9
    end

    test "with input {{<!!>},{<!!>},{<!!>},{<!!>}} returns 9" do
      assert AdventOfCode2017.Day9.get_score("{{<!!>},{<!!>},{<!!>},{<!!>}}") == 9
    end

    test "with input {{<a!>},{<a!>},{<a!>},{<ab>}} returns 3" do
      assert AdventOfCode2017.Day9.get_score("{{<a!>},{<a!>},{<a!>},{<ab>}}") == 3
    end

    test "with input {{<!>},{<!>},{<!>},{<a>}} returns 3" do
      assert AdventOfCode2017.Day9.get_score("{{<!>},{<!>},{<!>},{<a>}}") == 3
    end

    test "with example input returns 16689" do
      assert AdventOfCode2017.Day9.get_score(File.read!("day9_input.txt")) == 16689
    end
  end

  describe "Day 9 Part 2 get_garbage_count/1" do
    test "with input <> returns 0" do
      assert AdventOfCode2017.Day9.get_garbage_count("<>") == 0
    end

    test "with input <random characters> returns 17" do
      assert AdventOfCode2017.Day9.get_garbage_count("<random characters>") == 17
    end

    test "with input <<<<> returns 3" do
      assert AdventOfCode2017.Day9.get_garbage_count("<<<<>") == 3
    end

    test "with input <{!>}> returns 2" do
      assert AdventOfCode2017.Day9.get_garbage_count("<{!>}>") == 2
    end

    test "with input <!!> returns 0" do
      assert AdventOfCode2017.Day9.get_garbage_count("<!!>") == 0
    end

    test "with input <!!!>> returns 0" do
      assert AdventOfCode2017.Day9.get_garbage_count("<!!!>>") == 0
    end

    test "with input <{oai!a,<{i<a> returns 10" do
      assert AdventOfCode2017.Day9.get_garbage_count("<{oai!a,<{i<a>") == 10
    end

    test "with example input returns 7982" do
      assert AdventOfCode2017.Day9.get_garbage_count(File.read!("day9_input.txt")) == 7982
    end
  end
end