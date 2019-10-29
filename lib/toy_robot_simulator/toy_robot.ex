defmodule ToyRobotSimulator.ToyRobot do

  import ToyRobotSimulator.Tabletop

  defstruct [x: 0, y: 0, facing: :east]
  alias ToyRobotSimulator.ToyRobot

  @doc """
  Moves the toy robot one space in the direction it's facing.
  ## Examples
    iex> alias ToyRobotSimulator.ToyRobot
    ToyRobotSimulator.ToyRobot
    iex> toy_robot = %ToyRobot{}
    %ToyRobot{x: 0, y: 0, facing: :east}
    iex> toy_robot |> ToyRobot.move
    %ToyRobot{x: 1, y: 0, facing: :east}
    iex> toy_robot |> ToyRobot.move |> ToyRobot.move
    %ToyRobot{x: 2, y: 0, facing: :east}
  """

  def move(%ToyRobot{} = robot) do
    case robot.facing do
      :east -> %ToyRobot{robot | x: robot.x + 1}
      :west -> %ToyRobot{robot | x: robot.x - 1}
      :north -> %ToyRobot{robot | y: robot.y + 1}
      :south -> %ToyRobot{robot | y: robot.y - 1}
    end
  end

  def place(location) do
    if is_valid_location(location) do
      %ToyRobot{x: location.x, y: location.y, facing: location.facing}
    else
      %ToyRobot{}
    end
  end

end
