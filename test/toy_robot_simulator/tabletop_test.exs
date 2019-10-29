defmodule ToyRobotSimulator.TabletopTest do

  use ExUnit.Case
  doctest ToyRobotSimulator.Tabletop
  alias ToyRobotSimulator.Tabletop

  describe "valid_location() when only x is supplied" do
    test "when a valid location" do
      location = %{x: 0}
      result = location |> Tabletop.valid_location?
      assert result == true
    end
  end

  describe "valid_location() when only y is supplied" do
    test "when a valid location" do
      location = %{y: 0}
      result = location |> Tabletop.valid_location?
      assert result == true
    end
  end

  describe "valid_location() when both x and y are supplied" do
    test "when a valid location" do
      location = %{x: 0, y: 0}
      result = location |> Tabletop.valid_location?
      assert result == true
    end
  end

end
