defmodule Robot do
  @moduledoc false
  defstruct [
    :direction,
    :position
  ]

  def new(direction, position) do
    %__MODULE__{direction: direction, position: position}
  end
end
