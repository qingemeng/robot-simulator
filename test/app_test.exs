defmodule AppTest do
  use ExUnit.Case

  #  test "create errors if invalid direction given" do
  #    position = {0, 0}
  #    invalid_direction = {:error, "invalid direction"}
  #
  #    assert RobotSimulator.create(:invalid, position) == invalid_direction
  #    assert RobotSimulator.create(0, position) == invalid_direction
  #    assert RobotSimulator.create("east", position) == invalid_direction
  #  end
  #
  #  test "create errors if invalid position given" do
  #    direction = :north
  #    invalid_position = {:error, "invalid position"}
  #
  #    assert RobotSimulator.create(direction, {0, 0, 0}) == invalid_position
  #    assert RobotSimulator.create(direction, {0, :invalid}) == invalid_position
  #    assert RobotSimulator.create(direction, {"0", 0}) == invalid_position
  #
  #    assert RobotSimulator.create(direction, "invalid") == invalid_position
  #    assert RobotSimulator.create(direction, 0) == invalid_position
  #    assert RobotSimulator.create(direction, [0, 0]) == invalid_position
  #    assert RobotSimulator.create(direction, nil) == invalid_position
  #  end

  test "simulate errors on invalid instructions" do
    room = Room.new(-20, 20)

    assert Robot.new()
           |> App.run(room, "UUDDLRLRBASTART") == {:error, "invalid instruction"}
  end

  test "run does not move robot when it hits the border" do
    room = Room.new(2,2)
    result =
      Robot.new()
      |> App.run(room, "AA")

    assert result == {:ok, %Robot{direction: :north, x: 0, y: 1}}
  end

  test "run/3" do
    room = Room.new(20, 20)

#    r1 =
#      Robot.new()
#      |> App.run(room, "LAAARALA")
#
#    assert r1 == {:ok, %Robot{direction: :west, x: -4, y: 1}}
#
#    r2 =
#      Robot.new(:east, 2, -7)
#      |> App.run(room, "RRAAAAALA")
#
#    assert r2 == {:ok, %Robot{direction: :south, x: -3, y: -8}}

    r3 =
      Robot.new(:south, 8, 4)
      |> App.run(room, "LAAARRRALLLL")

    assert r3 == {:ok, %Robot{direction: :north, x: 11, y: 5}}
  end
end
