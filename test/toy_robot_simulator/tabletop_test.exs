defmodule ToyRobotSimulator.TabletopTest do

  use ExUnit.Case
  doctest ToyRobotSimulator.Tabletop
  alias ToyRobotSimulator.Tabletop

  # Single dimension

  describe "valid_x_location?() is true" do
    test "when only x is supplied at the bottom end of the x dimension" do
      assert Tabletop.valid_x_location?(%{x: 0}) == true
    end

    test "when only x is supplied at the top end of the x dimension" do
      assert Tabletop.valid_x_location?(%{x: 4}) == true
    end
  end

  describe "valid_y_location?()" do
    test "when only y is supplied at the bottom end of the y dimension" do
      assert Tabletop.valid_y_location?(%{y: 0}) == true
    end

    test "when only y is supplied at the top end of the y dimension" do
      assert Tabletop.valid_y_location?(%{y: 4}) == true
    end
  end

  describe "valid_location?()" do

    # Bottom left corner

    test "when both x and y are supplied for the bottom left corner" do
      assert Tabletop.valid_location?(%{x: 0, y: 0}) == true
    end

    # Bottom right corner

    test "when both x and y are supplied for the bottom right corner" do
      assert Tabletop.valid_location?(%{x: 4, y: 0}) == true
    end

    # Top left corner

    test "when both x and y are supplied for the top left corner" do
      assert Tabletop.valid_location?(%{x: 0, y: 4}) == true
    end

    # Top right corner

    test "when both x and y are supplied for the top right corner" do
      assert Tabletop.valid_location?(%{x: 4, y: 4}) == true
    end
  end

  describe "valid_location?() is false" do

    # Single dimension

    test "when only x is supplied below the bottom end of the x dimension" do
      assert Tabletop.valid_x_location?(%{x: -1}) == false
    end

    test "when only x is supplied above the top end of the x dimension" do
      assert Tabletop.valid_x_location?(%{x: 5}) == false
    end

    test "when only y is supplied below the bottom end of the y dimension" do
      assert Tabletop.valid_y_location?(%{y: -1}) == false
    end

    test "when only y is supplied above the top end of the y dimension" do
      assert Tabletop.valid_y_location?(%{y: 5}) == false
    end

    # Bottom left corner

    test "when both x and y are supplied for the left of the bottom left corner" do
      assert Tabletop.valid_location?(%{x: -1, y: 0}) == false
    end

    test "when both x and y are supplied for below the bottom left corner" do
      assert Tabletop.valid_location?(%{x: 0, y: -1}) == false
    end

    test "when both x and y are supplied for below and to the left of the bottom left corner" do
      assert Tabletop.valid_location?(%{x: -1, y: -1}) == false
    end

    # Bottom right corner

    test "when both x and y are supplied for the right of the bottom right corner" do
      assert Tabletop.valid_location?(%{x: 5, y: 0}) == false
    end

    test "when both x and y are supplied for below the bottom right corner" do
      assert Tabletop.valid_location?(%{x: 4, y: -1}) == false
    end

    test "when both x and y are supplied for below and to the right of the bottom right corner" do
      assert Tabletop.valid_location?(%{x: 5, y: -1}) == false
    end

    # Top left corner

    test "when both x and y are supplied for the left of the top left corner" do
      assert Tabletop.valid_location?(%{x: -1, y: 4}) == false
    end

    test "when both x and y are supplied for above the top left corner" do
      assert Tabletop.valid_location?(%{x: 0, y: 5}) == false
    end

    test "when both x and y are supplied for above and to the left of the top left corner" do
      assert Tabletop.valid_location?(%{x: -1, y: 5}) == false
    end

    # Top right corner

    test "when both x and y are supplied for the right of the top right corner" do
      assert Tabletop.valid_location?(%{x: 5, y: 4}) == false
    end

    test "when both x and y are supplied for above the top right corner" do
      assert Tabletop.valid_location?(%{x: 4, y: 5}) == false
    end

    test "when both x and y are supplied for above and to the right of the top right corner" do
      assert Tabletop.valid_location?(%{x: 5, y: 5}) == false
    end
  end

end
