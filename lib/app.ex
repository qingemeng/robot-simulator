defmodule App do
  @moduledoc false
  alias Room
  alias Robot

  #  room = Room.new(6, 6)
  #  robot = Robot.new()
  #  commands = ""

  def run(robot, room, instruction) do
    commands = instruction
               |> String.graphemes()

    [_, robot] = Enum.reduce_while(
      commands,
      [commands, robot],
      fn c, [rest, robot] ->
        if length(rest) > 0 do
          robot = Robot.execute(robot, c)
          [_ | rest] = rest
          {:cont, [rest, robot]}
        else
          {:halt, [rest, robot]}
        end
      end
    )
    robot
  end
end
