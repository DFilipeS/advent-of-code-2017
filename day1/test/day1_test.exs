defmodule Day1Test do
  use ExUnit.Case

  test "reverse_captcha_next" do
    assert Day1.reverse_captcha_next("1122") == 3
    assert Day1.reverse_captcha_next("1111") == 4
    assert Day1.reverse_captcha_next("1234") == 0
    assert Day1.reverse_captcha_next("91212129") == 9
  end

  test "reverse_captcha_halfway" do
    assert Day1.reverse_captcha_halfway("1212") == 6
    assert Day1.reverse_captcha_halfway("1221") == 0
    assert Day1.reverse_captcha_halfway("123425") == 4
    assert Day1.reverse_captcha_halfway("123123") == 12
    assert Day1.reverse_captcha_halfway("12131415") == 4
  end
end
