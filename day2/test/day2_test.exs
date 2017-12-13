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
end
