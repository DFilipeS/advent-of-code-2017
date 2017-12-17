defmodule Day6 do
  @moduledoc """
  Documentation for Day6.
  """

  @doc """
  Find the number of steps needed to detect the cycle.

  ## Examples

      iex> Day6.find_cycle([0, 2, 7, 0])
      5

  """
  def find_cycle(banks) when is_list(banks) do
    find_cycle(banks, [], 0)
  end

  def find_cycle(banks) do
    banks
    |> String.split(" ")
    |> Enum.filter(fn x -> x != "" end)
    |> Enum.map(fn x -> elem(Integer.parse(x), 0) end)
    |> find_cycle()
  end

  def find_cycle(banks, configurations, steps) do
    cond do
      banks in configurations ->
        steps
      true ->
        configurations = configurations ++ [banks]
        max = Enum.max(banks)
        index = Enum.find_index(banks, fn x -> x == max end)
        banks = List.replace_at(banks, index, 0)
        banks = fill_banks(banks, rem(index + 1, length(banks)), max)
        find_cycle(banks, configurations, steps + 1)
    end
  end

  def find_cycle_period(banks) when is_list(banks) do
    find_cycle_period(banks, %{}, 0)
  end

  def find_cycle_period(banks) do
    banks
    |> String.split(" ")
    |> Enum.filter(fn x -> x != "" end)
    |> Enum.map(fn x -> elem(Integer.parse(x), 0) end)
    |> find_cycle_period()
  end

  def find_cycle_period(banks, configurations, steps) do
    cond do
      banks in Map.keys(configurations) ->
        steps - Map.get(configurations, banks)
      true ->
        configurations = Map.put(configurations, banks, steps)
        max = Enum.max(banks)
        index = Enum.find_index(banks, fn x -> x == max end)
        banks = List.replace_at(banks, index, 0)
        banks = fill_banks(banks, rem(index + 1, length(banks)), max)
        find_cycle_period(banks, configurations, steps + 1)
    end
  end

  defp fill_banks(banks, _index, 0) do
    banks
  end

  defp fill_banks(banks, index, blocks) do
    banks = List.update_at(banks, index, &(&1 + 1))
    new_index = rem(index + 1, length(banks))
    fill_banks(banks, new_index, blocks - 1)
  end
end
