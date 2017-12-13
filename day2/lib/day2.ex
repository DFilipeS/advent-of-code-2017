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
end
