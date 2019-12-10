defmodule Validation do
  @moduledoc false

  @commands ["L", "R", "A"]
  def validate_commands(commands) do
    valid =
      commands
      |> Enum.uniq()
      |> MapSet.new()
      |> MapSet.subset?(MapSet.new(@commands))

    if valid, do: :ok, else: {:error, "invalid instruction"}
  end
end
