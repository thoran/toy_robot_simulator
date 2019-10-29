defmodule ToyRobotSimulator.Tabletop do

  defstruct [x_dimension: 4, y_dimension: 4]
  alias ToyRobotSimulator.Tabletop

  def is_valid_location(%{x: x}) do
    x >= 0 && x <= %Tabletop{}.x_dimension
  end

  def is_valid_location(%{y: y}) do
    y >= 0 && y <= %Tabletop{}.y_dimension
  end

  def is_valid_location(%{x: x, y: y}) do
    is_valid_location(%{x: x}) && is_valid_location(%{y: y})
  end

end
