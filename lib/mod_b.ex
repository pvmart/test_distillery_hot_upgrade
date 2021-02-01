defmodule Mod.B do
  @behaviour Mod

  def rt, do: {:ok, :"Mod.B.rt"}
  def ct, do: {:ok, :"Mod.B.ct"}
end
