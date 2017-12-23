defmodule AdventOfCode2017.Day4 do
  @moduledoc """
  Module for the problem for Day 4 of Advent Of Code 2017.
  """

  @doc """
  Counts the number of valid passphrases in the list of passphrases given.
  Passphrases are valid if there are no duplicate words in it.

  ## Examples

      iex> AdventOfCode2017.Day4.count_valid("aa bb cc aaa")
      1

      iex> AdventOfCode2017.Day4.count_valid("aa bb cc a bb")
      0

  """
  @spec count_valid(String.t()) :: integer()
  def count_valid(passphrases) do
    passphrases
    |> parse_passphrases()
    |> Enum.filter(fn words -> length(Enum.uniq(words)) == length(words) end)
    |> length()
  end

  @doc """
  Counts the number of valid passphrases in the list of passphrases given.
  Passphrases are valid if there are no words that are anagrams of each other.

  ## Examples

      iex> AdventOfCode2017.Day4.count_valid_without_anagrams("aa bb cc aaa")
      1

      iex> AdventOfCode2017.Day4.count_valid_without_anagrams("aba bb cc baa bb")
      0

  """
  @spec count_valid_without_anagrams(String.t()) :: integer()
  def count_valid_without_anagrams(passphrases) do
    passphrases
    |> parse_passphrases()
    |> Enum.filter(fn words -> has_anagrams?(words) == false end)
    |> length()
  end

  defp has_anagrams?(words) do
    sorted_words =
      Enum.map(words, fn word ->
        word
        |> String.split("", trim: true)
        |> Enum.sort()
        |> Enum.join()
      end)

    length(Enum.uniq(sorted_words)) != length(words)
  end

  defp parse_passphrases(passphrases) do
    passphrases
    |> String.split("\n", trim: true)
    |> Enum.map(&String.split/1)
  end
end
