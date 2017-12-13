defmodule Day2Test do
  use ExUnit.Case

  test "checksum" do
    input = """
    5 1 9 5
    7 5 3
    2 4 6 8
    """

    assert Day2.checksum(input) == 18
  end

  test "checksum2" do
    input = """
    5 9 2 8
    9 4 7 3
    3 8 6 5
    """

    assert Day2.checksum2(input) == 9
  end
end
