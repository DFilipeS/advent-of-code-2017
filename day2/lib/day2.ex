defmodule Day2 do
  def checksum(spreadsheet) do
    spreadsheet
    |> String.split("\n")
    |> Enum.filter(fn x -> x != "" end)
    |> Enum.map(fn row ->
      numbers =
        row
        |> String.split(" ")
        |> Enum.map(fn x -> elem(Integer.parse(x), 0) end)
      Enum.max(numbers) - Enum.min(numbers)
    end)
    |> Enum.sum()
  end

  def checksum2(spreadsheet) do
    spreadsheet
    |> String.split("\n")
    |> Enum.filter(fn x -> x != "" end)
    |> Enum.map(fn row ->
      numbers =
        row
        |> String.split(" ")
        |> Enum.map(fn x -> elem(Integer.parse(x), 0) end)
        |> find_even_division()
    end)
    |> Enum.sum()
  end

  defp find_even_division(numbers) do
    numbers = Enum.with_index(numbers)

    Enum.map(numbers, fn {x, index} ->
      Enum.reduce(numbers, 0, fn ({y, index}, acc) ->
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
