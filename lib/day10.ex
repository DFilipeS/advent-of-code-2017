defmodule AdventOfCode2017.Day10 do
  @moduledoc """
  Module for the problem for Day 10 of Advent Of Code 2017.
  """

  require Bitwise

  @doc """
  Given a `list` of numbers and a string of `lengths`, do a round of the Knot Hash
  and return the value of the multiplication of the first two values.

  ## Examples

      iex> AdventOfCode2017.Day10.multiply_first([0,1,2,3], "4,5,8")
      2

  """
  def multiply_first(list, lengths) do
    lengths = 
      lengths
      |> String.split(",", trim: true)
      |> Enum.map(fn x -> elem(Integer.parse(x), 0) end)
    {list, lengths}

    {[first | [second | _rest]], _skip_size, _position} = get_hash(list, lengths, 0, 0)
    first * second
  end

  @doc """
  Calculate the full Knot Hash of the given `input` string with 64 iterations.

  ## Examples

      iex> AdventOfCode2017.Day10.knot_hash("Daniel Silva")
      "df639fb8e1e42180c38b5c1ae6e40231"

  """
  def knot_hash(input) do
    input
    |> get_lengths()
    |> get_sparse_hash()
    |> get_dense_hash()
    |> convert_to_hex()
  end

  defp circular_get_sublist(list, start_position, end_position) do
    Enum.map(start_position..end_position, fn index ->
      Enum.at(list, rem(index, length(list)))
    end)
  end

  defp circular_replace_sublist(list, sublist, start_position, end_position) do
    start_position..end_position
    |> Enum.with_index()
    |> Enum.reduce(list, fn ({position, index}, acc) ->
      List.replace_at(acc, rem(position, length(list)), Enum.at(sublist, index))
    end)
  end

  defp get_hash(list, [], skip_size, position) do
    {list, skip_size, position}
  end

  defp get_hash(list, [n | rest], skip_size, position) do
    start_position = rem(position, length(list))
    end_position = rem(position, length(list)) + n - 1

    sublist = 
      list
      |> circular_get_sublist(start_position, end_position)
      |> Enum.reverse()

    list
    |> circular_replace_sublist(sublist, start_position, end_position)
    |> get_hash(rest, skip_size + 1, position + n + skip_size)
  end

  defp get_lengths(input) do
    input
    |> String.to_charlist()
    |> Kernel.++([17, 31, 73, 47, 23])
  end

  defp get_sparse_hash(lengths) do
    initial_state = {Enum.into(0..255, []), 0, 0}
    
    0..63
    |> Enum.reduce(initial_state, fn (_n, {list, skip_size, position}) ->
      get_hash(list, lengths, skip_size, position)
    end)
    |> elem(0)
  end

  defp get_dense_hash(sparse_hash) do
    sparse_hash
    |> Enum.chunk_every(16)
    |> Enum.map(fn [first | rest] ->
      Enum.reduce(rest, first, fn (x, acc) -> Bitwise.bxor(acc, x) end)
    end)
  end

  defp convert_to_hex(list) do
    list
    |> Enum.map(fn x -> 
      hex = String.downcase(Integer.to_string(x, 16))
      
      cond do
        String.length(hex) == 2 -> hex
        true -> "0#{hex}"
      end
    end)
    |> Enum.join()
  end
end