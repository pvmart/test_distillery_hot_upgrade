defmodule ImplTest do
  use ExUnit.Case
  doctest Impl

  test "greets the world" do
    assert Impl.hello() == :world
  end
end
