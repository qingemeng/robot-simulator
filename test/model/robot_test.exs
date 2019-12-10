defmodule RobotTest do
  use ExUnit.Case
  alias Robot

  test "creates robot at default location" do
    assert Robot.new() == %Robot{direction: :north, x: 0, y: 0}
  end

  test "creates robot at location" do
    assert Robot.new(:east, 1, 2) == %Robot{direction: :east, x: 1, y: 2}
  end

  describe "execute/2" do
    setup do
      [robot: Robot.new(:north, 0, 0)]
    end

    test "rotates left", %{robot: robot} do
      robot = Robot.execute(robot, "L")
      assert robot == %Robot{direction: :west, x: 0, y: 0}
      robot = Robot.execute(robot, "L")
      assert robot == %Robot{direction: :south, x: 0, y: 0}
      robot = Robot.execute(robot, "L")
      assert robot == %Robot{direction: :east, x: 0, y: 0}
      robot = Robot.execute(robot, "L")
      assert robot == %Robot{direction: :north, x: 0, y: 0}
    end

    test "rotates right", %{robot: robot} do
      robot = Robot.execute(robot, "R")
      assert robot == %Robot{direction: :east, x: 0, y: 0}
      robot = Robot.execute(robot, "R")
      assert robot == %Robot{direction: :south, x: 0, y: 0}
      robot = Robot.execute(robot, "R")
      assert robot == %Robot{direction: :west, x: 0, y: 0}
      robot = Robot.execute(robot, "R")
      assert robot == %Robot{direction: :north, x: 0, y: 0}
    end

    test "moves ahead", %{robot: robot} do
      assert Robot.execute(robot, "A") == %Robot{direction: :north, x: 0, y: 1}
    end
  end
end
