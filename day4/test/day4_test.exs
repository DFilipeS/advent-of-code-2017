defmodule Day4Test do
  use ExUnit.Case
  doctest Day4

  test "count_valid" do
    passphrases = """
    aa bb cc dd ee
    aa bb cc dd aa
    aa bb cc dd aaa
    """
    assert Day4.count_valid(passphrases) == 2
  end

  test "has_anagrams?" do
    refute Day4.has_anagrams?(["abcde", "fghij"])
    assert Day4.has_anagrams?(["abcde", "xyz", "ecdab"])
    refute Day4.has_anagrams?(["a", "ab", "abc", "abd", "abf", "abj"])
    refute Day4.has_anagrams?(["iiii", "oiii", "ooii", "oooi", "oooo"])
    assert Day4.has_anagrams?(["oiii", "ioii", "iioi", "iiio"])
  end

  test "count_valid_with_anagrams" do
    passphrases = """
    abcde fghij
    abcde xyz ecdab
    a ab abc abd abf abj
    iiii oiii ooii oooi oooo
    oiii ioii iioi iiio
    """
    assert Day4.count_valid_with_anagrams(passphrases) == 3
  end
end
