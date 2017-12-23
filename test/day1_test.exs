defmodule AdventOfCode2017.Day1Test do
  use ExUnit.Case
  doctest AdventOfCode2017.Day1

  describe "Day 1 Part 1 reverse_captcha_next/1" do
    test "with input 1122 returns 3" do
      assert AdventOfCode2017.Day1.reverse_captcha_next("1122") == 3
    end

    test "with input 1111 returns 4" do
      assert AdventOfCode2017.Day1.reverse_captcha_next("1111") == 4
    end

    test "with input 1234 returns 0" do
      assert AdventOfCode2017.Day1.reverse_captcha_next("1234") == 0
    end

    test "with input 91212129 returns 9" do
      assert AdventOfCode2017.Day1.reverse_captcha_next("91212129") == 9
    end
  end

  describe "Day 1 Part 2 reverse_captcha_halfway/1" do
    test "with input 1212 returns 6" do
      assert AdventOfCode2017.Day1.reverse_captcha_halfway("1212") == 6
    end

    test "with input 1221 returns 0" do
      assert AdventOfCode2017.Day1.reverse_captcha_halfway("1221") == 0
    end

    test "with input 123425 returns 4" do
      assert AdventOfCode2017.Day1.reverse_captcha_halfway("123425") == 4
    end

    test "with input 123123 returns 12" do
      assert AdventOfCode2017.Day1.reverse_captcha_halfway("123123") == 12
    end

    test "with input 12131415 returns 4" do
      assert AdventOfCode2017.Day1.reverse_captcha_halfway("12131415") == 4
    end
  end
end
