defmodule AdventOfCode2017.Day9 do
  @moduledoc """
  Module for the problem for Day 9 of Advent Of Code 2017.
  """

  @doc """
  Calculate the sum of group levels in the given `group` string.

  ## Examples

      iex> AdventOfCode2017.Day9.get_score("{{}, {}, {}}")
      7

  """
  @spec get_score(String.t()) :: integer()
  def get_score(group) do
    group
    |> parse_input()
    |> sum_groups_values()
  end

  @doc """
  Count the number of non-canceled garbage characters in the given
  `group` string.

  ## Examples

      iex> AdventOfCode2017.Day9.get_garbage_count("{<ada!s><aaa>}")
      6

  """
  @spec get_garbage_count(String.t()) :: integer()
  def get_garbage_count(group) do
    group
    |> parse_input()
    |> count_garbage_characters()
  end

  defp parse_input(input) do
    input
    |> String.split("", trim: true)
    |> removed_canceled()
  end

  defp removed_canceled(characters) do
    cond do
      length(characters) == 0 -> []
      List.first(characters) == "!" -> removed_canceled(Enum.drop(characters, 2))
      true -> [List.first(characters)] ++ removed_canceled(Enum.drop(characters, 1))
    end
  end

  defp sum_groups_values(characters) do
    characters
    |> Enum.reduce({[], 0, false}, fn (x, {stack, sum, is_garbage}) -> 
      cond do
        x == "{" and not is_garbage -> 
          {[x] ++ stack, sum, is_garbage}
        x == "}" and not is_garbage -> 
          {elem(List.pop_at(stack, 0), 1), sum + length(stack), is_garbage}
        x == "<" and not is_garbage ->
          {stack, sum, true}
        x == ">" and is_garbage ->
          {stack, sum, false}
        true -> 
          {stack, sum, is_garbage}
      end
    end)
    |> elem(1)
  end

  defp count_garbage_characters(characters) do
    characters
    |> Enum.reduce({0, false}, fn (x, {sum, is_garbage}) -> 
      cond do
        x == "<" and not is_garbage ->
          {sum, true}
        x == ">" and is_garbage ->
          {sum, false}
        is_garbage -> 
          {sum + 1, is_garbage}
        true -> 
          {sum, is_garbage}
      end
    end)
    |> elem(0)
  end
end