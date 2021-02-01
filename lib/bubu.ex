defmodule Bubu do
  defdelegate ct, to: Impl.impl(Mod), as: :ct
  def rt, do: Impl.impl(Mod).rt()
end
