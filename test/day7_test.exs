defmodule AdventOfCode2017.Day7Test do
  use ExUnit.Case
  doctest AdventOfCode2017.Day7

  describe "Day 7 Part 1 bottom_program/1" do
    test "with example input returns \"tknk\"" do
      input = """
      pbga (66)
      xhth (57)
      ebii (61)
      havc (66)
      ktlj (57)
      fwft (72) -> ktlj, cntj, xhth
      qoyq (66)
      padx (45) -> pbga, havc, qoyq
      tknk (41) -> ugml, padx, fwft
      jptl (61)
      ugml (68) -> gyxo, ebii, jptl
      gyxo (61)
      cntj (57)
      """
      assert AdventOfCode2017.Day7.bottom_program(input) == "tknk"
    end
  end

  describe "Day 7 Part 2 get_corrected_weigth/1" do
    test "with example input returns 60" do
      input = """
      pbga (66)
      xhth (57)
      ebii (61)
      havc (66)
      ktlj (57)
      fwft (72) -> ktlj, cntj, xhth
      qoyq (66)
      padx (45) -> pbga, havc, qoyq
      tknk (41) -> ugml, padx, fwft
      jptl (61)
      ugml (68) -> gyxo, ebii, jptl
      gyxo (61)
      cntj (57)
      """
      assert AdventOfCode2017.Day7.get_corrected_weigth(input) == 60
    end

    test "with example input returns 420" do
      input = File.read!("day7_input.txt")
      assert AdventOfCode2017.Day7.get_corrected_weigth(input) == 420
    end
  end
end
