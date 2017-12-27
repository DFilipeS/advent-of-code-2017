defmodule AdventOfCode2017.Day8 do
  @moduledoc """
  Module for the problem for Day 8 of Advent Of Code 2017.
  """

  @doc """
  Get the largest value in registers at the end of the instructions list given by `input`.

  ## Examples

      iex> AdventOfCode2017.Day8.largest_value("a inc 1 if b < 5\\nb inc 10 if a == 1\\n")
      10

  """
  @spec largest_value(String.t()) :: integer()
  def largest_value(input) do
    input
    |> parse_input()
    |> Enum.reduce(Map.new(), fn (instruction, registers) ->
      process_instruction(registers, instruction)
    end)
    |> Map.values()
    |> Enum.max()
  end

  @doc """
  Get the maximum value to appear in the registers during the execution of the instructions
  list given by `input`.

  ## Examples

      iex> AdventOfCode2017.Day8.max_value("a inc 20 if a == 0\\na dec 5 if a > 0\\n")
      20

  """
  @spec max_value(String.t()) :: integer()
  def max_value(input) do
    input
    |> parse_input()
    |> Enum.reduce({0, Map.new()}, fn (instruction, {max, registers}) ->
      registers = process_instruction(registers, instruction)
      registers_max = Enum.max(Map.values(registers))

      cond do
        registers_max > max -> {registers_max, registers}
        true -> {max, registers}
      end
    end)
    |> elem(0)
  end

  defp parse_input(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(&(String.split(&1)))
  end

  defp check_register(registers, register) do
    case Map.get(registers, register) do
      nil -> Map.put(registers, register, 0)
      _register -> registers
    end
  end

  defp evaluate_condition(registers, compare_register, operator, compare_value) do
    compare_value = elem(Integer.parse(compare_value), 0)
    case operator do
      "==" -> Map.get(registers, compare_register) == compare_value
      "<=" -> Map.get(registers, compare_register) <= compare_value
      ">=" -> Map.get(registers, compare_register) >= compare_value
      "!=" -> Map.get(registers, compare_register) != compare_value
      "<" -> Map.get(registers, compare_register) < compare_value
      ">" -> Map.get(registers, compare_register) > compare_value
    end
  end

  defp perform_operation(registers, register, operation, value) do
    value = elem(Integer.parse(value), 0)
    case operation do
      "inc" -> Map.update!(registers, register, &(&1 + value))
      "dec" -> Map.update!(registers, register, &(&1 - value))
    end
  end

  defp process_instruction(registers, [register, operation, value, "if", compare_register, operator, compare_value]) do
    registers = 
      registers 
      |> check_register(register) 
      |> check_register(compare_register)

    case evaluate_condition(registers, compare_register, operator, compare_value) do
      false -> registers
      true -> perform_operation(registers, register, operation, value)
    end
  end
end