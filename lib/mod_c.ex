defmodule Mod.C do
  @behaviour Mod

  def rt, do: {:ok, :"Mod.C.rt"}
  def ct, do: {:ok, :"Mod.C.ct"}
end
