defmodule Euler.Integer do
  @moduledoc """
  Functions working with integers.
  """

  @doc """
  Returns the greatest common divisor of two numbers `x` and `y` by using the Euclidian algorithm.
  """
  def gcd(x, 0) do
    abs(x)
  end

  def gcd(x, y) do
    remainder = rem(x, y)
    gcd(y, remainder)
  end
end
