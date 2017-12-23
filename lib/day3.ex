defmodule AdventOfCode2017.Day3 do
  @moduledoc """
  Module for the problem for Day 3 of Advent Of Code 2017.
  """

  @doc """
  Calculates the Mahattan distance between the origin of the spiral grid and the
  cell after `steps + 1` taken.

  ## Examples

      iex> AdventOfCode2017.Day3.distance(13)
      3.0

  """
  @spec distance(integer()) :: number()
  def distance(steps) do
    steps
    |> get_coordinates()
    |> manhattan_distance({0, 0})
  end

  @doc """
  Returns the next larger value inserted in the spiral by calculating its value
  by summing all the adjacent values of the cell.

  ## Examples

      iex> AdventOfCode2017.Day3.next_larger_than(100)
      122

  """
  @spec next_larger_than(integer()) :: integer()
  def next_larger_than(target) do
    initial_grid = %{{0, 0} => 1}
    initial_position = {0, 0}
    initial_steps = {1, 1}

    spiral(initial_grid, initial_position, initial_steps, "RIGHT", target)
  end

  # Source: https://groups.google.com/forum/#!msg/sci.math/Fv9hMosmMHY/Erv4AJ8ehwIJ
  defp get_coordinates(n) do
    m = Float.floor((:math.sqrt(n) + 1) / 2)
    k = n - 4 * m * (m - 1)
    cond do
      1 <= k and k <= 2 * m -> {m, k - m}
      2 * m <= k and k <= 4 * m -> {3 * m - k, m}
      4 * m <= k and k <= 6 * m -> {-m, 5 * m - k}
      6 * m <= k and k <= 8 * m -> {k - 7 * m, -m}
    end
  end

  defp manhattan_distance({a, b}, {c, d}) do
    abs(a - c) + abs(b - d)
  end

  defp spiral(grid, {x, y}, {steps, total_steps}, direction, target) do
    coordinates = get_next_coordinates(direction, {x, y}, steps)
    value = adjacent_sum(grid, coordinates)
    grid = Map.put(grid, coordinates, value)

    cond do
      value > target -> value
      steps == total_steps -> spiral(grid, coordinates, {1, get_next_total_steps(direction, total_steps)}, get_next_direction(direction), target)
      true -> spiral(grid, {x, y}, {steps + 1, total_steps}, direction, target)
    end
  end

  defp adjacent_sum(grid, coordinates) do
    Enum.map(-1..1, fn a ->
      Enum.map(-1..1, fn b ->
        Map.get(grid, {elem(coordinates, 0) + a, elem(coordinates, 1) + b}, 0)
      end)
    end)
    |> List.flatten()
    |> Enum.sum()
  end

  defp get_next_direction(direction) do
    case direction do
      "RIGHT" -> "UP"
      "UP" -> "LEFT"
      "LEFT" -> "DOWN"
      "DOWN" -> "RIGHT"
    end
  end

  defp get_next_coordinates(direction, {x, y}, steps) do
    case direction do
      "RIGHT" -> {x + steps, y}
      "UP" -> {x, y + steps}
      "LEFT" -> {x - steps, y}
      "DOWN" -> {x, y - steps}
    end
  end

  defp get_next_total_steps(direction, total_steps) do
    case direction do
      "RIGHT" -> total_steps
      "LEFT" -> total_steps
      "UP" -> total_steps + 1
      "DOWN" -> total_steps + 1
    end
  end
end
