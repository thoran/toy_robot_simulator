defmodule ToyRobotSimulator.TabletopTest do

  use ExUnit.Case
  doctest ToyRobotSimulator.Tabletop
  alias ToyRobotSimulator.Tabletop

  describe "valid_location?() is true" do
    test "when only x is supplied" do
      location = %{x: 0}
      result = location |> Tabletop.valid_location?
      assert result == true
    end

    test "when only y is supplied" do
      location = %{y: 0}
      result = location |> Tabletop.valid_location?
      assert result == true
    end

    test "when both x and y are supplied" do
      location = %{x: 0, y: 0}
      result = location |> Tabletop.valid_location?
      assert result == true
    end
  end

  describe "valid_location?() is false" do
    test "when only x is supplied" do
      location = %{x: 5}
      result = location |> Tabletop.valid_location?
      assert result == false
    end

    test "when only y is supplied" do
      location = %{y: 5}
      result = location |> Tabletop.valid_location?
      assert result == false
    end

    test "when both x and y are supplied" do
      location = %{x: 5, y: 5}
      result = location |> Tabletop.valid_location?
      assert result == false
    end
  end

end
