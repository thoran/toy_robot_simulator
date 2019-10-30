defmodule ToyRobotSimulator.ToyRobot do

  import ToyRobotSimulator.Tabletop

  defstruct [x: nil, y: nil, facing: nil]
  alias ToyRobotSimulator.ToyRobot

  @doc """
    Places the toy robot on the grid.

    ## Examples
      iex> alias ToyRobotSimulator.ToyRobot
      ToyRobotSimulator.ToyRobot
      iex> %ToyRobot{}
      %ToyRobot{x: nil, y: nil, facing: nil}
      iex> location = %{x: 0, y: 0}
      %{x: 0, y: 0}
      iex> location_and_orientation = %{x: location.x, y: location.y, facing: :west}
      %{x: 0, y: 0, facing: :west}
      iex> ToyRobot.place(location_and_orientation)
      %ToyRobot{x: 0, y: 0, facing: :west}
  """
  def place(location_and_orientation) do
    location = %{x: location_and_orientation.x, y: location_and_orientation.y}
    if valid_location?(location) do
      %ToyRobot{x: location_and_orientation.x, y: location_and_orientation.y, facing: location_and_orientation.facing}
    else
      %ToyRobot{}
    end
  end

  @doc """
    Moves the toy robot one space in the direction it's facing.

    ## Examples
      iex> alias ToyRobotSimulator.ToyRobot
      ToyRobotSimulator.ToyRobot
      iex> toy_robot = %ToyRobot{x: 0, y: 0, facing: :east}
      %ToyRobot{x: 0, y: 0, facing: :east}
      iex> toy_robot |> ToyRobot.move
      %ToyRobot{x: 1, y: 0, facing: :east}
      iex> toy_robot |> ToyRobot.move |> ToyRobot.move
      %ToyRobot{x: 2, y: 0, facing: :east}
  """
  def move(%ToyRobot{x: x, y: y, facing: facing} = toy_robot) do
    if valid_move?(toy_robot) do
      case facing do
        :east -> %ToyRobot{toy_robot | x: x + 1}
        :west -> %ToyRobot{toy_robot | x: x - 1}
        :north -> %ToyRobot{toy_robot | y: y + 1}
        :south -> %ToyRobot{toy_robot | y: y - 1}
      end
    else
      toy_robot
    end
  end

  @doc """
    Turns the toy robot 90 degrees in place.

    ## Examples
      iex> alias ToyRobotSimulator.ToyRobot
      ToyRobotSimulator.ToyRobot
      iex> toy_robot = %ToyRobot{x: 0, y: 0, facing: :east}
      %ToyRobot{x: 0, y: 0, facing: :east}
      iex> ToyRobot.turn(:left, toy_robot)
      %ToyRobot{x: 0, y: 0, facing: :north}
      iex> ToyRobot.turn(:right, toy_robot)
      %ToyRobot{x: 0, y: 0, facing: :south}
  """
  def turn(way, %ToyRobot{} = toy_robot) do
    case way do
      :left -> turn_left(toy_robot)
      :right -> turn_right(toy_robot)
    end
  end

  def report(toy_robot) do
    IO.puts report_string(toy_robot)
  end

  def report_string(toy_robot) do
    output_facing = String.upcase(Atom.to_string(toy_robot.facing))
    "#{toy_robot.x},#{toy_robot.y},#{output_facing}"
  end

  def valid_move?(%ToyRobot{x: x, y: y, facing: facing}) do
    current_location = %{x: x, y: y}
    candidate_location = (
      case facing do
        :east -> %{current_location | x: x + 1}
        :west -> %{current_location | x: x - 1}
        :north -> %{current_location | y: y + 1}
        :south -> %{current_location | y: y - 1}
      end
    )
    valid_location?(candidate_location)
  end

  defp turn_left(%ToyRobot{facing: facing} = toy_robot) do
    case facing do
      :east -> %ToyRobot{toy_robot | facing: :north}
      :west -> %ToyRobot{toy_robot | facing: :south}
      :north -> %ToyRobot{toy_robot | facing: :west}
      :south -> %ToyRobot{toy_robot | facing: :east}
    end
  end

  defp turn_right(%ToyRobot{facing: facing} = toy_robot) do
    case facing do
      :east -> %ToyRobot{toy_robot | facing: :south}
      :west -> %ToyRobot{toy_robot | facing: :north}
      :north -> %ToyRobot{toy_robot | facing: :east}
      :south -> %ToyRobot{toy_robot | facing: :west}
    end
  end

end
