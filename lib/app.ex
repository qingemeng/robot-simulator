defmodule App do
  @moduledoc false
  alias Room
  alias Robot
  alias Validation

  #  room = Room.new(6, 6)
  #  robot = Robot.new()
  #  commands = ""

  def run(robot, room, instruction) do
    commands =
      instruction
      |> String.graphemes()

    with :ok <- Validation.validate_commands(commands) do
      [_, robot, room] =
        Enum.reduce_while(
          commands,
          [commands, robot, room],
          fn c, [rest, robot, room] ->
            if length(rest) > 0 do
              [robot, room] = execute_command(robot, room, c)
              [_ | rest] = rest
              {:cont, [rest, robot, room]}
            else
              {:halt, [rest, robot, room]}
            end
          end
        )

      {:ok, robot}
    else
      error -> error
    end
  end

  def execute_command(robot, room, command) do
    if Robot.hit_border(robot, room, command) or Robot.hit_block(robot, room, command) do
      [robot, room]
    else
      new_robot = Robot.execute(robot, command)
      room = room
             |> Room.release(robot.x, robot.y)
             |> Room.occupy(new_robot.x, new_robot.y)
      [new_robot, room]
    end
  end
end
