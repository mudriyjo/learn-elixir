defmodule GameSimulationTest do
  use ExUnit.Case
  doctest GameSimulation

  test "greets the world" do
    assert GameSimulation.hello() == :world
  end
end
