defmodule Day4 do
  def count_valid(passphrases) do
    passphrases
    |> String.split("\n")
    |> Enum.filter(fn x -> x != "" end)
    |> Enum.map(fn x ->
      words = String.split(x)
      unique_words = Enum.uniq(words)
      cond do
        length(unique_words) == length(words) -> 1
        true -> 0
      end
    end)
    |> Enum.sum()
  end

  def count_valid_with_anagrams(passphrases) do
    passphrases
    |> String.split("\n")
    |> Enum.filter(fn x -> x != "" end)
    |> Enum.map(fn x ->
      words = String.split(x, " ")
      cond do
        has_anagrams?(words) -> 0
        true -> 1
      end
    end)
    |> Enum.sum()
  end

  def has_anagrams?(words) do
    sorted_words =
      Enum.map(words, fn word ->
        word
        |> String.split("")
        |> Enum.filter(fn x -> x != "" end)
        |> Enum.sort()
        |> Enum.join()
      end)

    length(Enum.uniq(sorted_words)) != length(words)
  end
end
