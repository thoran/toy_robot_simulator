defmodule ToyRobotSimulator.ToyRobotTest do

  use ExUnit.Case
  doctest ToyRobotSimulator.ToyRobot
  alias ToyRobotSimulator.ToyRobot

  describe ".move()" do
    test "when facing East" do
      toy_robot = %ToyRobotSimulator.ToyRobot{x: 0, y: 0, facing: :east}
      toy_robot = toy_robot |> ToyRobot.move
      assert toy_robot == %ToyRobot{x: 1, y: 0, facing: :east}
    end

    test "when facing West" do
      toy_robot = %ToyRobotSimulator.ToyRobot{x: 1, y: 0, facing: :west}
      toy_robot = toy_robot |> ToyRobot.move
      assert toy_robot == %ToyRobot{x: 0, y: 0, facing: :west}
    end

    test "when facing North" do
      toy_robot = %ToyRobotSimulator.ToyRobot{x: 0, y: 0, facing: :north}
      toy_robot = toy_robot |> ToyRobot.move
      assert toy_robot == %ToyRobot{x: 0, y: 1, facing: :north}
    end

    test "when facing South" do
      toy_robot = %ToyRobotSimulator.ToyRobot{x: 0, y: 1, facing: :south}
      toy_robot = toy_robot |> ToyRobot.move
      assert toy_robot == %ToyRobot{x: 0, y: 0, facing: :south}
    end
  end

end
