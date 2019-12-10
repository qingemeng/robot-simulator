defmodule Room do
  @moduledoc false
  defstruct [
    :width,
    :height
  ]

  def new(width, height) do
    %__MODULE__{width: width, height: height}
  end
end
