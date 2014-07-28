defmodule Euler.IntegerTest do
  use ExUnit.Case

  test "gcd/2 returns the greatest common divisor of two numbers" do
    positive_numbers = [{4, 2, 2}, {2, 4, 2}, {3, 4, 1}, {40902, 24140, 34}]
    negative_numbers = [{-4, 2, 2}, {2, -4, 2}, {-3, -4, 1}, {-40902, 24140, 34}]

    tests = positive_numbers ++ negative_numbers
    Enum.map tests, fn {x, y, answer} ->
      assert Euler.Integer.gcd(x, y) == answer
    end
  end
end
