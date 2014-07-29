defmodule Euler.Rational do
  @moduledoc """
  Represent and manipulate rational numbers (fractions with integers numbers at the numerator and the denominator, the denominator different than 0).
  """

  @doc """
  Returns an irreductible fraction, with at most one minus sign, on the numerator only.
  """
  def reduce(frac = {num, denom}) do
    gcd = Euler.Integer.gcd(num, denom)
    normalize_signs {div(num, gcd), div(denom, gcd)}
  end

  @doc """
  Returns the irreductible fraction of the multiplication of two rationals.
  """
  def mul(frac1, frac2) do
    { {num1, denom1}, {num2, denom2} } = { reduce(frac1), reduce(frac2) }
    gcd1 = Euler.Integer.gcd(num1, denom2)
    gcd2 = Euler.Integer.gcd(denom1, num2)

    result1 = Kernel.div(num1, gcd1) * Kernel.div(num2, gcd2)
    result2 = Kernel.div(denom1, gcd2) * Kernel.div(denom2, gcd1)

    normalize_signs({result1, result2})
  end

  @doc """
  Returns the irreductible fraction fo the division of two rationals.
  """
  def dvn(frac1, {num2, denom2}) do
    mul(frac1, {denom2, num2})
  end

  defp normalize_signs(frac = {num, denom}) when denom > 0 do
    frac
  end

  defp normalize_signs({num, denom}) when (num > 0 and denom < 0) or (num < 0 and denom < 0) do
    {-num, -denom}
  end
end
