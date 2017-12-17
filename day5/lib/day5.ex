defmodule Day5 do
  @moduledoc """
  Documentation for Day5.
  """

  @doc """
  Count the amount of steps necessary for the CPU to escape the maze of crazy
  instructions.

  ## Examples

      iex> Day5.steps_to_exit([0, 3, 0, 1, -3])
      5

  """
  def steps_to_exit(instructions) when is_list(instructions) do
    steps_to_exit(instructions, 0, 0)
  end

  def steps_to_exit(instructions) do
    instructions
    |> String.split("\n")
    |> Enum.filter(fn x -> x != "" end)
    |> Enum.map(fn x -> elem(Integer.parse(x), 0) end)
    |> steps_to_exit()
  end

  def steps_to_exit(instructions, steps, index) do
    cond do
      length(instructions) > index ->
        updated_index = index + Enum.at(instructions, index)
        updated_instructions = List.update_at(instructions, index, &(&1 + 1))
        steps_to_exit(updated_instructions, steps + 1, updated_index)
      true ->
        steps
    end
  end

  @doc """
  Count the amount of steps necessary for the CPU to escape the maze of crazy
  instructions.

  ## Examples

      iex> Day5.steps_to_exit_stranger([0, 3, 0, 1, -3])
      10

  """
  def steps_to_exit_stranger(instructions) when is_list(instructions) do
    steps_to_exit_stranger(instructions, 0, 0)
  end

  def steps_to_exit_stranger(instructions) do
    instructions
    |> String.split("\n")
    |> Enum.filter(fn x -> x != "" end)
    |> Enum.map(fn x -> elem(Integer.parse(x), 0) end)
    |> steps_to_exit_stranger()
  end

  def steps_to_exit_stranger(instructions, steps, index) do
    cond do
      length(instructions) > index ->
        updated_index = index + Enum.at(instructions, index)
        updated_instructions = List.update_at(instructions, index, fn x ->
          cond do
            x >= 3 -> x - 1
            true -> x + 1
          end
        end)
        steps_to_exit_stranger(updated_instructions, steps + 1, updated_index)
      true ->
        steps
    end
  end
end
