defmodule ToyRobotSimulator.ToyRobotTest do

  use ExUnit.Case
  doctest ToyRobotSimulator.ToyRobot
  alias ToyRobotSimulator.ToyRobot

  test ".move()" do
    toy_robot = %ToyRobotSimulator.ToyRobot{x: 0, y: 0, facing: :east}
    toy_robot = toy_robot |> ToyRobot.move
    assert toy_robot == %ToyRobot{x: 1, y: 0, facing: :east}
  end

end
