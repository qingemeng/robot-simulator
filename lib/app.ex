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
      [_, robot] =
        Enum.reduce_while(
          commands,
          [commands, robot],
          fn c, [rest, robot] ->
            if length(rest) > 0 do
              robot = execute_command(robot, room, c)
              [_ | rest] = rest
              {:cont, [rest, robot]}
            else
              {:halt, [rest, robot]}
            end
          end
        )

      {:ok, robot}
    else
      error -> error
    end
  end

  defp execute_command(robot, room, command) do
    if !Robot.hit_border(robot, room, command), do: Robot.execute(robot, command), else: robot
  end
end
