defmodule RoomTest do
  use ExUnit.Case
  alias Room

  test "creates room with width and height" do
    assert Room.new(3, 3) == %Room{width: 3, height: 3}
  end
end
