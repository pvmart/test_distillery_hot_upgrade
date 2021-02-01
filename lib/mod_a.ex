defmodule Mod.A do
  @behaviour Mod

  def rt, do: {:ok, :"Mod.A.rt"}
  def ct, do: {:ok, :"Mod.A.ct"}
end
