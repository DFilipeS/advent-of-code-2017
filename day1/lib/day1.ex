defmodule Day1 do

  def reverse_captcha_next(numbers_string) do
    numbers_list = process_string(numbers_string)

    numbers_list
    |> Enum.with_index()
    |> Enum.reduce(0, fn ({number, index}, acc) ->
      case Enum.at(numbers_list, get_next_index(numbers_list, index)) do
        ^number -> acc + number
        _other -> acc
      end
    end)
  end

  def reverse_captcha_halfway(numbers_string) do
    numbers_list = process_string(numbers_string)

    numbers_list
    |> Enum.with_index()
    |> Enum.reduce(0, fn ({number, index}, acc) ->
      case Enum.at(numbers_list, get_halfway_index(numbers_list, index)) do
        ^number -> acc + number
        _other -> acc
      end
    end)
  end

  defp process_string(numbers_string) do
    numbers_string
    |> String.split("")
    |> Enum.filter(fn x -> x != "" end)
    |> Enum.map(fn x -> elem(Integer.parse(x), 0) end)
  end

  defp get_next_index(list, index) do
    rem(index + 1, length(list))
  end

  defp get_halfway_index(list, index) do
    rem(index + div(length(list), 2), length(list))
  end
end
