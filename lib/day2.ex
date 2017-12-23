defmodule AdventOfCode2017.Day2 do
  @moduledoc """
  Module for the problem for Day 2 of Advent Of Code 2017.
  """

  @doc """
  Calculate the sum of the difference between the max and min values in each
  line of the `spreadsheet`.

  ## Examples

      iex> AdventOfCode2017.Day2.checksum_min_max("1 3 2")
      2

  """
  def checksum_min_max(spreadsheet, separator \\ " ") do
    spreadsheet
    |> parse_spreadsheet(separator)
    |> Enum.map(fn row ->
      {min, max} = Enum.min_max(row)
      max - min
    end)
    |> Enum.sum()
  end

  @doc """
  Calculate the sum of the division of the only two numbers that divisible in
  each line of the `spreadsheet`.

  ## Examples

      iex> AdventOfCode2017.Day2.checksum_divisible("3 2 5 9")
      3

  """
  def checksum_divisible(spreadsheet, separator \\ " ") do
    spreadsheet
    |> parse_spreadsheet(separator)
    |> Enum.map(&find_even_division/1)
    |> Enum.sum()
  end

  defp parse_spreadsheet(spreadsheet, separator) do
    spreadsheet
    |> String.split("\n", trim: true)
    |> Enum.map(fn row ->
      row
      |> String.split(separator)
      |> Enum.map(fn number ->
        Integer.parse(number) |> elem(0)
      end)
    end)
  end

  defp find_even_division(numbers) do
    Enum.map(numbers, fn x ->
      Enum.reduce(numbers, 0, fn (y, acc) ->
        max = Enum.max([x, y])
        min = Enum.min([x, y])
        cond do
          x != y and rem(max, min) == 0 -> div(max, min)
          true -> acc
        end
      end)
    end)
    |> Enum.max()
  end
end
