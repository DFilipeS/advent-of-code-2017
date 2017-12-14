defmodule Day3 do
  @doc """
  Source: https://groups.google.com/forum/#!msg/sci.math/Fv9hMosmMHY/Erv4AJ8ehwIJ
  """
  def spiral_coordinates(n) do
    m = Float.floor((:math.sqrt(n) + 1) / 2)
    k = n - 4 * m * (m - 1)
    cond do
      1 <= k and k <= 2 * m -> {m, k - m}
      2 * m <= k and k <= 4 * m -> {3 * m - k, m}
      4 * m <= k and k <= 6 * m -> {-m, 5 * m - k}
      6 * m <= k and k <= 8 * m -> {k - 7 * m, -m}
    end
  end

  def distance({a, b}, {c, d}) do
    abs(a - c) + abs(b - d)
  end

  def spiral(grid, {x, y} = position, steps, "RIGHT", target) do
    {grid, cursor} = Enum.reduce(1..steps, {grid, position}, fn (n, {acc, cursor}) ->
      coordinates = {x + n, y}
      value =
        Enum.map(-1..1, fn a ->
          Enum.map(-1..1, fn b ->
            Map.get(acc, {elem(coordinates, 0) + a, elem(coordinates, 1) + b}, 0)
          end)
        end)
        |> List.flatten()
        |> Enum.sum()
      {Map.put(acc, coordinates, value), coordinates}
    end)

    result = Enum.find_value(Enum.sort(Map.values(grid)), fn x ->
      cond do
        x >= target -> x
        true -> nil
      end
    end)

    case result do
      nil ->
        spiral(grid, cursor, steps, "UP", target)
      other ->
        other
    end
  end

  def spiral(grid, {x, y} = position, steps, "UP", target) do
    {grid, cursor} = Enum.reduce(1..steps, {grid, position}, fn (n, {acc, cursor}) ->
      coordinates = {x, y + n}
      value =
        Enum.map(-1..1, fn a ->
          Enum.map(-1..1, fn b ->
            Map.get(acc, {elem(coordinates, 0) + a, elem(coordinates, 1) + b}, 0)
          end)
        end)
        |> List.flatten()
        |> Enum.sum()
      {Map.put(acc, coordinates, value), coordinates}
    end)

    result = Enum.find_value(Enum.sort(Map.values(grid)), fn x ->
      cond do
        x >= target -> x
        true -> nil
      end
    end)

    case result do
      nil ->
        spiral(grid, cursor, steps + 1, "LEFT", target)
      other ->
        other
    end
  end

  def spiral(grid, {x, y} = position, steps, "LEFT", target) do
    {grid, cursor} = Enum.reduce(1..steps, {grid, position}, fn (n, {acc, cursor}) ->
      coordinates = {x - n, y}
      value =
        Enum.map(-1..1, fn a ->
          Enum.map(-1..1, fn b ->
            Map.get(acc, {elem(coordinates, 0) + a, elem(coordinates, 1) + b}, 0)
          end)
        end)
        |> List.flatten()
        |> Enum.sum()
      {Map.put(acc, coordinates, value), coordinates}
    end)

    result = Enum.find_value(Enum.sort(Map.values(grid)), fn x ->
      cond do
        x >= target -> x
        true -> nil
      end
    end)

    case result do
      nil ->
        spiral(grid, cursor, steps, "DOWN", target)
      other ->
        other
    end
  end

  def spiral(grid, {x, y} = position, steps, "DOWN", target) do
    {grid, cursor} = Enum.reduce(1..steps, {grid, position}, fn (n, {acc, cursor}) ->
      coordinates = {x, y - n}
      value =
        Enum.map(-1..1, fn a ->
          Enum.map(-1..1, fn b ->
            Map.get(acc, {elem(coordinates, 0) + a, elem(coordinates, 1) + b}, 0)
          end)
        end)
        |> List.flatten()
        |> Enum.sum()
      {Map.put(acc, coordinates, value), coordinates}
    end)

    result = Enum.find_value(Enum.sort(Map.values(grid)), fn x ->
      cond do
        x >= target -> x
        true -> nil
      end
    end)

    case result do
      nil ->
        spiral(grid, cursor, steps + 1, "RIGHT", target)
      other ->
        other
    end
  end
end
