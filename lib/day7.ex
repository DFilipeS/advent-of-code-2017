defmodule AdventOfCode2017.Day7 do
  @moduledoc """
  Module for the problem for Day 7 of Advent Of Code 2017.
  """

  @doc """
  Determines the root programs of the tree of programs given by the
  string `input`.

  ## Examples

      iex> AdventOfCode2017.Day7.bottom_program("aaaa (10)\\nbbbb (10) -> aaaa\\n")
      "bbbb"

  """
  @spec bottom_program(String.t()) :: String.t()
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

  @doc """
  Gets the corrected weight of an unbalanced node to make the tree "balanced" (every child node has
  the same subtree weight).

  ## Examples

      iex> AdventOfCode2017.Day7.get_corrected_weigth("aaaa (10) -> bbbb, cccc, dddd\\nbbbb (5)\\ncccc (7)\\ndddd (5)\\n")
      5

  """
  @spec get_corrected_weigth(String.t()) :: integer()
  def get_corrected_weigth(input) do
    tree = 
      input
      |> parse_input()
      |> Enum.reduce(%{}, fn (node, acc) -> Map.put(acc, node["node"], node) end)
    root = bottom_program(input)

    # Go through the stack and find the first group of child weights that are unbalanced.
    # The first group of weights is the deepest node that is unbalanced in the tree
    # of programs, therefore, where the node with wrong weight is. Given that, correct it.
    stack = get_tree_stack(tree, tree[root], [root])
    index = 
      stack
      |> Enum.map(fn node ->
        case tree[node]["children"] do
          nil -> []
          children -> Enum.map(children, &(calculate_subtree_weight(tree, tree[&1])))
        end
      end)
      |> Enum.find_index(&(length(Enum.uniq(&1)) > 1))
    unbalanced_node = tree[Enum.at(stack, index)]

    correct_weight(tree, unbalanced_node)
  end

  defp calculate_subtree_weight(tree, node) do
    case node["children"] do
      nil -> 
        node["weight"]
      children ->
        children
          |> Enum.map(&(calculate_subtree_weight(tree, tree[&1])))
          |> Enum.sum()
          |> Kernel.+(node["weight"])
    end
  end

  defp get_tree_stack(tree, node, stack) do
    case node["children"] do
      nil -> stack
      children ->
        stack = children ++ stack
        Enum.reduce(node["children"], stack, fn (child, acc) ->
          get_tree_stack(tree, tree[child], acc)
        end)
    end
    
  end

  defp correct_weight(tree, unbalanced_node) do
    weights = Enum.map(unbalanced_node["children"], &(calculate_subtree_weight(tree, tree[&1])))
    
    index = Enum.find_index(weights, &(&1 not in List.delete(weights, &1)))
    node = tree[Enum.at(unbalanced_node["children"], index)]
    
    subtree_wrong_weight = Enum.at(weights, index)
    subtree_correct_weight = List.delete_at(weights, index) |> List.first()
    
    correction = subtree_correct_weight - subtree_wrong_weight

    node["weight"] + correction
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
