defmodule Robot do
  @moduledoc false
  defstruct [
    :direction,
    :x,
    :y
  ]

  @forward_map %{
    north: [0, 1],
    east: [1, 0],
    south: [0, -1],
    west: [-1, 0]
  }

  def new(direction \\ :north, x \\ 0, y \\ 0) do
    %__MODULE__{direction: direction, x: x, y: y}
  end

  def execute(robot, command) when command == "L" or command == "R" do
    %{direction: direction, x: x, y: y} = robot

    %__MODULE__{
      direction: rotate(direction, command),
      x: x,
      y: y
    }
  end

  def execute(robot, "A") do
    %{direction: direction, x: x, y: y} = robot
    [x_move, y_move] = @forward_map[direction]

    %__MODULE__{
      direction: direction,
      x: x + x_move,
      y: y + y_move
    }
  end

  defp rotate(:north, "L"), do: :west
  defp rotate(:east, "L"), do: :north
  defp rotate(:south, "L"), do: :east
  defp rotate(:west, "L"), do: :south

  defp rotate(:north, "R"), do: :east
  defp rotate(:east, "R"), do: :south
  defp rotate(:south, "R"), do: :west
  defp rotate(:west, "R"), do: :north
end
