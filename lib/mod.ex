defmodule Mod do
  @moduledoc """
  Mod (behaviour)
  """
  @callback rt :: {:ok, term}
  @callback ct :: {:ok, term}
end
