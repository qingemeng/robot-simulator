defmodule Room do
  @moduledoc false
  defstruct [
    :width,
    :height,
    :blocks
  ]

  def new(width, height, blocks \\ []) do
    %__MODULE__{width: width, height: height, blocks: blocks}
  end

  def release(room, x, y) do
    blocks = List.delete(room.blocks, %{x: x, y: y})
    %__MODULE__{width: room.width, height: room.height, blocks: blocks}
  end

  def occupy(room, x, y) do
    blocks = room.blocks ++ [%{x: x, y: y}] |> Enum.uniq()
    %__MODULE__{width: room.width, height: room.height, blocks: blocks}
  end
end
