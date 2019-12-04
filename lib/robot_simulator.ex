defmodule RobotSimulator do
  alias Robot

  @directions  [:north, :east, :south, :west]

  @doc """
  Create a Robot Simulator given an initial direction and position.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  @spec create(direction :: atom, position :: {integer, integer}) :: any
  def create(direction \\ :north, position \\ {0, 0}) do
    with :ok <- validate_direction(direction),
         :ok <- validate_position(position) do
      Robot.new(direction, position)
    end
  end

  defp validate_direction(direction) do
    if Enum.member?(@directions, direction) do
      :ok
    else
      {:error, "invalid direction"}
    end
  end

  defp validate_position({x, y}) when is_number(x) and is_number(y) do
    :ok
  end

  defp validate_position(_) do
    {:error, "invalid position"}
  end

  @doc """
  Simulate the robot's movement given a string of instructions.

  Valid instructions are: "R" (turn right), "L", (turn left), and "A" (advance)
  """
  @spec simulate(robot :: any, instructions :: String.t()) :: any
  def simulate(robot, instructions) do
  end

  @doc """
  Return the robot's direction.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  @spec direction(robot :: any) :: atom
  def direction(robot) do
    robot
    |> Map.get(:direction)
  end

  @doc """
  Return the robot's position.
  """
  @spec position(robot :: any) :: {integer, integer}
  def position(robot) do
    robot
    |> Map.get(:position)
  end
end
