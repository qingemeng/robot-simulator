defmodule RoomTest do
  use ExUnit.Case
  alias Room

  test "creates room with width and height" do
    assert Room.new(3, 3) == %Room{width: 3, height: 3, blocks: []}
  end

  test "release block" do
    room = Room.new(3, 3, [%{x: 1, y: 1}, %{x: 2, y: 2}])
           |> Room.release(2, 2)
    assert room.blocks == [%{x: 1, y: 1}]
  end

  test "release block when it's not occupied" do
    room = Room.new(3, 3, [%{x: 1, y: 1}])
           |> Room.release(2, 2)
    assert room.blocks == [%{x: 1, y: 1}]
  end

  test "occupy block" do
    room = Room.new(3, 3, [%{x: 1, y: 1}])
           |> Room.occupy(2, 2)
    assert room.blocks == [%{x: 1, y: 1}, %{x: 2, y: 2}]
  end

  test "occupy block when it's occupied" do
    room = Room.new(3, 3, [%{x: 2, y: 2}])
           |> Room.occupy(2, 2)
    assert room.blocks == [%{x: 2, y: 2}]
  end
end
