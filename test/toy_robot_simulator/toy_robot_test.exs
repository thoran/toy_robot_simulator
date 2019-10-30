defmodule ToyRobotSimulator.ToyRobotTest do

  use ExUnit.Case
  doctest ToyRobotSimulator.ToyRobot
  alias ToyRobotSimulator.ToyRobot

  describe "place()" do
    test "when a valid location" do
      location = %{x: 2, y: 3, facing: :north}
      toy_robot = ToyRobot.place(location)
      assert toy_robot == %ToyRobot{x: 2, y: 3, facing: :north}
    end

    test "when an invalid location" do
      location = %{x: 5, y: 3, facing: :north}
      toy_robot = ToyRobot.place(location)
      assert toy_robot == %ToyRobot{x: nil, y: nil, facing: nil}
    end
  end

  describe "move()" do
    test "when facing East" do
      toy_robot = %ToyRobot{x: 0, y: 0, facing: :east}
      toy_robot = ToyRobot.move(toy_robot)
      assert toy_robot == %ToyRobot{x: 1, y: 0, facing: :east}
    end

    test "when facing West" do
      toy_robot = %ToyRobot{x: 1, y: 0, facing: :west}
      toy_robot = ToyRobot.move(toy_robot)
      assert toy_robot == %ToyRobot{x: 0, y: 0, facing: :west}
    end

    test "when facing North" do
      toy_robot = %ToyRobot{x: 0, y: 0, facing: :north}
      toy_robot = ToyRobot.move(toy_robot)
      assert toy_robot == %ToyRobot{x: 0, y: 1, facing: :north}
    end

    test "when facing South" do
      toy_robot = %ToyRobot{x: 0, y: 1, facing: :south}
      toy_robot = ToyRobot.move(toy_robot)
      assert toy_robot == %ToyRobot{x: 0, y: 0, facing: :south}
    end

    test "when facing East at the Eastern edge of the grid" do
      toy_robot = %ToyRobot{x: 4, y: 0, facing: :east}
      toy_robot = ToyRobot.move(toy_robot)
      assert toy_robot == %ToyRobot{x: 4, y: 0, facing: :east}
    end

    test "when facing West at the Western edge of the grid" do
      toy_robot = %ToyRobot{x: 0, y: 0, facing: :west}
      toy_robot = ToyRobot.move(toy_robot)
      assert toy_robot == %ToyRobot{x: 0, y: 0, facing: :west}
    end

    test "when facing North at the Northern edge of the grid" do
      toy_robot = %ToyRobot{x: 0, y: 4, facing: :north}
      toy_robot = ToyRobot.move(toy_robot)
      assert toy_robot == %ToyRobot{x: 0, y: 4, facing: :north}
    end

    test "when facing South at the Southern edge of the grid" do
      toy_robot = %ToyRobot{x: 0, y: 0, facing: :south}
      toy_robot = ToyRobot.move(toy_robot)
      assert toy_robot == %ToyRobot{x: 0, y: 0, facing: :south}
    end
  end

  describe "turn()" do

    # Left turn

    test "when turning left, facing East" do
      toy_robot = %ToyRobot{x: 0, y: 0, facing: :east}
      toy_robot = ToyRobot.turn(:left, toy_robot)
      assert toy_robot.facing == :north
    end

    test "when turning left, facing West" do
      toy_robot = %ToyRobot{x: 0, y: 0, facing: :west}
      toy_robot = ToyRobot.turn(:left, toy_robot)
      assert toy_robot.facing == :south
    end

    test "when turning left, facing North" do
      toy_robot = %ToyRobot{x: 0, y: 0, facing: :north}
      toy_robot = ToyRobot.turn(:left, toy_robot)
      assert toy_robot.facing == :west
    end

    test "when turning left, facing South" do
      toy_robot = %ToyRobot{x: 0, y: 0, facing: :south}
      toy_robot = ToyRobot.turn(:left, toy_robot)
      assert toy_robot.facing == :east
    end

    # Right turn

    test "when turning right, facing East" do
      toy_robot = %ToyRobot{x: 0, y: 0, facing: :east}
      toy_robot = ToyRobot.turn(:right, toy_robot)
      assert toy_robot.facing == :south
    end

    test "when turning right, facing West" do
      toy_robot = %ToyRobot{x: 0, y: 0, facing: :west}
      toy_robot = ToyRobot.turn(:right, toy_robot)
      assert toy_robot.facing == :north
    end

    test "when turning right, facing North" do
      toy_robot = %ToyRobot{x: 0, y: 0, facing: :north}
      toy_robot = ToyRobot.turn(:right, toy_robot)
      assert toy_robot.facing == :east
    end

    test "when turning right, facing South" do
      toy_robot = %ToyRobot{x: 0, y: 0, facing: :south}
      toy_robot = ToyRobot.turn(:right, toy_robot)
      assert toy_robot.facing == :west
    end
  end

  describe "report()" do
    test "reports the current location and orientation" do
      location = %{x: 0, y: 0, facing: :east}
      toy_robot = ToyRobot.place(location)
      assert ToyRobot.report(toy_robot) == :ok
    end
  end

  describe "report_string()" do
    test "reports the current location and orientation" do
      location = %{x: 0, y: 0, facing: :east}
      toy_robot = ToyRobot.place(location)
      assert ToyRobot.report_string(toy_robot) == "0,0,EAST"
    end
  end

  describe "valid_move?()" do
    test "when facing East on the Eastern edge of the grid" do
      toy_robot = %ToyRobot{x: 4, y: 0, facing: :east}
      assert ToyRobot.valid_move?(toy_robot) == false
    end

    test "when facing East on the Western edge of the grid" do
      toy_robot = %ToyRobot{x: 0, y: 0, facing: :east}
      assert ToyRobot.valid_move?(toy_robot) == true
    end

    test "when facing West on the Western edge of the grid" do
      toy_robot = %ToyRobot{x: 0, y: 0, facing: :west}
      assert ToyRobot.valid_move?(toy_robot) == false
    end

    test "when facing West on the Eastern edge of the grid" do
      toy_robot = %ToyRobot{x: 4, y: 0, facing: :west}
      assert ToyRobot.valid_move?(toy_robot) == true
    end

    test "when facing North on the Northern edge of the grid" do
      toy_robot = %ToyRobot{x: 0, y: 4, facing: :north}
      assert ToyRobot.valid_move?(toy_robot) == false
    end

    test "when facing North on the Southern edge of the grid" do
      toy_robot = %ToyRobot{x: 0, y: 0, facing: :north}
      assert ToyRobot.valid_move?(toy_robot) == true
    end

    test "when facing South on the Southern edge of the grid" do
      toy_robot = %ToyRobot{x: 0, y: 0, facing: :south}
      assert ToyRobot.valid_move?(toy_robot) == false
    end

    test "when facing South on the Northern edge of the grid" do
      toy_robot = %ToyRobot{x: 0, y: 4, facing: :south}
      assert ToyRobot.valid_move?(toy_robot) == true
    end
  end

end
