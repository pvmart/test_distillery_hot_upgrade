defmodule Impl do
  @moduledoc """
  Documentation for `Impl`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Impl.hello()
      :world

  """
  def hello do
    :world
  end

  def impl(mod) do
    :impl
    |> Application.get_env(mod)
    |> Keyword.fetch!(:impl)
  end
end
