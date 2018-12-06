defmodule AdventOfCode2018.Day04.Part1 do
  alias AdventOfCode2018.Utils
  alias AdventOfCode2018.Day04.Guards

  def checksum(file_path) do
    events = 
      file_path
      |> Utils.read_lines!
      |> Enum.sort
      |> Enum.map(&Guards.parse_event/1)
      |> Guards.register_events

    {guard_id, {sleep_time, minutes_asleep}} = 
      events
      |> Map.to_list
      |> Enum.max_by(fn {guard_id, {sleep_time, _}} ->
        sleep_time
      end)

    most_frequent_minute = Enum.max_by(minutes_asleep, fn minute -> Enum.count(minutes_asleep, &(&1 == minute)) end)

    """
    {guard_id_2, most_frequent_minute_2, _times} =
      events
      |> Map.to_list
      |> Enum.map(fn {guard_id, {_, minutes_asleep}} ->
        Enum.map(Enum.uniq(minutes_asleep), fn minute -> {guard_id, minute, Enum.count(minutes_asleep, &(&1 == minute))} end)
      end)
      |> Enum.map(fn guard_data -> Enum.max_by(guard_data, fn {_, _, times} -> times end) end)
      |> Enum.max_by(fn {_, _, times} -> times end)
    
    IO.puts(guard_id_2 * most_frequent_minute_2)
  """
  guard_id * most_frequent_minute
  end
end

ExUnit.start

defmodule AdventOfCode2018.Day04.Test1 do
  use ExUnit.Case

  import AdventOfCode2018.Day04.Part1

  test "result" do
    assert checksum("inputs/input.txt") == 140932
  end
end