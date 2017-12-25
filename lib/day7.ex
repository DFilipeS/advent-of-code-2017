defmodule AdventOfCode2017.Day7 do
  @moduledoc """
  Module for the problem for Day 7 of Advent Of Code 2017.
  """

  def bottom_program(input) do
    tree = parse_input(input)

    nodes = Enum.map(tree, fn x -> Map.get(x, "node") end)

    child_nodes =
      tree
      |> Enum.filter(fn x ->
        Map.get(x, "children") != nil
      end)
      |> Enum.flat_map(fn x ->
        Map.get(x, "children")
      end)

    [root] = nodes -- child_nodes
    root
  end
  defp parse_input(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(fn line ->
      regex = ~r/(?<node>\w+) [(](?<weight>\d+)[)]( -> (?<children>\S.*))?/
      captures = Regex.named_captures(regex, line)

      {weight, _rest} = Integer.parse(Map.get(captures, "weight"))
      captures = Map.put(captures, "weight", weight)

      case captures do
        %{"children" => ""} ->
          Map.put(captures, "children", nil)
        other ->
          children =
            other
            |> Map.get("children")
            |> String.split(", ")
          Map.put(captures, "children", children)
      end
    end)
  end
end
