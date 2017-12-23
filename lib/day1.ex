defmodule AdventOfCode2017.Day1 do
  @moduledoc """
  Module for the problem for Day 1 of Advent Of Code 2017.
  """

  @doc """
  Calculates the sum of elements that are equals to the new element.

  ## Examples

      iex> AdventOfCode2017.Day1.reverse_captcha_next("1111")
      4

  """
  @spec reverse_captcha_next(String.t()) :: number()
  def reverse_captcha_next(numbers) when is_binary(numbers) do
    numbers
    |> process_string()
    |> sum_numbers(&get_next_index/2)
  end

  @doc """
  Calculates the sum of elements that are equals to the element halfway of the
  list.

  ## Examples

      iex> AdventOfCode2017.Day1.reverse_captcha_halfway("1212")
      6

  """
  @spec reverse_captcha_halfway(String.t()) :: number()
  def reverse_captcha_halfway(numbers) when is_binary(numbers) do
    numbers
    |> process_string()
    |> sum_numbers(&get_halfway_index/2)
  end

  defp process_string(numbers_string) do
    numbers_string
    |> String.split("")
    |> Enum.filter(fn x -> x != "" end)
    |> Enum.map(fn x -> elem(Integer.parse(x), 0) end)
  end

  defp sum_numbers(list, get_index) do
    list
    |> Enum.with_index()
    |> Enum.reduce(0, fn ({number, index}, acc) ->
      case Enum.at(list, get_index.(list, index)) do
        ^number -> acc + number
        _other -> acc
      end
    end)
  end

  defp get_next_index(list, index) do
    rem(index + 1, length(list))
  end

  defp get_halfway_index(list, index) do
    rem(index + div(length(list), 2), length(list))
  end
end
