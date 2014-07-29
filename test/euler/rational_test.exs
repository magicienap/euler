defmodule Euler.RationalTest do
  use ExUnit.Case

  test "reduce/1 returns the irreductible fraction, with the minus sign at the top" do
    tests = [
      { { 8,  64}, { 1, 8} }, # Positive numbers, not reduced
      { { 1,   8}, { 1, 8} }, # Positive numbers, reduced
      { {-8,  64}, {-1, 8} }, # Minus sign at numerator, not reduced
      { { 8, -64}, {-1, 8} }, # Minus sign at denominator, not reduced
      { {-8, -64}, { 1, 8} }, # Negative numbers, not reduced
      { {-1,   8}, {-1, 8} }, # Minus sign at numerator, reduced
      { { 1,  -8}, {-1, 8} }, # Minus sign at denominator, reduced
      { {-1,  -8}, { 1, 8} }  # Negative numbers, reduced
    ]

    Enum.map tests, fn {fraction, answer} ->
      assert Euler.Rational.reduce(fraction) == answer
    end
  end

  test "mul/2 returns the multiplication of two rationals as an irreductible fraction" do
    tests = [
      { { { 2,  4}, { 17,  6} },  { 17, 12} }, # Positive numbers, not reduced
      { { { 1,  2}, { 17,  6} },  { 17, 12} }, # Positive numbers, reduced
      { { {-2,  4}, { 17,  6} },  {-17, 12} }, # Minus sign at numerator (first fraction), not reduced
      { { { 2,  4}, {-17,  6} },  {-17, 12} }, # Minus sign at numerator (second fraction), not reduced
      { { { 2, -4}, { 17,  6} },  {-17, 12} }, # Minus sign at denominator (first fraction), not reduced
      { { { 2,  4}, { 17, -6} },  {-17, 12} }, # Minus sign at denominator (second fraction), not reduced
      { { {-2, -4}, { 17,  6} },  { 17, 12} }, # Negative numbers (first fraction), not reduced
      { { { 2,  4}, {-17, -6} },  { 17, 12} }, # Negative numbers (second fraction), not reduced
      { { {-2, -4}, {-17, -6} },  { 17, 12} }, # Negative numbers (both fractions), not reduced
      { { {-2,  4}, { 17, -6} },  { 17, 12} }, # Negative numbers (numerator of the first fraction, denominator of the second), not reduced
      { { {-1,  2}, { 17,  6} },  {-17, 12} }, # Minus sign at numerator (first fraction), reduced
      { { { 1,  2}, {-17,  6} },  {-17, 12} }, # Minus sign at numerator (second fraction), reduced
      { { { 1, -2}, { 17,  6} },  {-17, 12} }, # Minus sign at denominator (first fraction), reduced
      { { { 1,  2}, { 17, -6} },  {-17, 12} }, # Minus sign at denominator (second fraction), reduced
      { { {-1, -2}, { 17,  6} },  { 17, 12} }, # Negative numbers (first fraction), reduced
      { { { 1,  2}, {-17, -6} },  { 17, 12} }, # Negative numbers (second fraction), reduced
      { { {-1, -2}, {-17, -6} },  { 17, 12} }, # Negative numbers (both fractions), reduced
      { { {-1,  2}, { 17, -6} },  { 17, 12} }  # Negative numbers (numerator of the first fraction, denominator of the second), reduced
    ]

    Enum.map tests, fn {{fraction1, fraction2}, answer} ->
      assert Euler.Rational.mul(fraction1, fraction2) == answer
    end
  end

  test "dvn/2 returns the division of two rationals as an irreductible fraction" do
    tests = [
      { { { 2,  4}, { 17,  6} },  { 3, 17} }, # Positive numbers, not reduced
      { { { 1,  2}, { 17,  6} },  { 3, 17} }, # Positive numbers, reduced
      { { {-2,  4}, { 17,  6} },  {-3, 17} }, # Minus sign at numerator (first fraction), not reduced
      { { { 2,  4}, {-17,  6} },  {-3, 17} }, # Minus sign at numerator (second fraction), not reduced
      { { { 2, -4}, { 17,  6} },  {-3, 17} }, # Minus sign at denominator (first fraction), not reduced
      { { { 2,  4}, { 17, -6} },  {-3, 17} }, # Minus sign at denominator (second fraction), not reduced
      { { {-2, -4}, { 17,  6} },  { 3, 17} }, # Negative numbers (first fraction), not reduced
      { { { 2,  4}, {-17, -6} },  { 3, 17} }, # Negative numbers (second fraction), not reduced
      { { {-2, -4}, {-17, -6} },  { 3, 17} }, # Negative numbers (both fractions), not reduced
      { { {-2,  4}, { 17, -6} },  { 3, 17} }, # Negative numbers (numerator of the first fraction, denominator of the second), not reduced
      { { {-1,  2}, { 17,  6} },  {-3, 17} }, # Minus sign at numerator (first fraction), reduced
      { { { 1,  2}, {-17,  6} },  {-3, 17} }, # Minus sign at numerator (second fraction), reduced
      { { { 1, -2}, { 17,  6} },  {-3, 17} }, # Minus sign at denominator (first fraction), reduced
      { { { 1,  2}, { 17, -6} },  {-3, 17} }, # Minus sign at denominator (second fraction), reduced
      { { {-1, -2}, { 17,  6} },  { 3, 17} }, # Negative numbers (first fraction), reduced
      { { { 1,  2}, {-17, -6} },  { 3, 17} }, # Negative numbers (second fraction), reduced
      { { {-1, -2}, {-17, -6} },  { 3, 17} }, # Negative numbers (both fractions), reduced
      { { {-1,  2}, { 17, -6} },  { 3, 17} }  # Negative numbers (numerator of the first fraction, denominator of the second), reduced
    ]

    Enum.map tests, fn {{fraction1, fraction2}, answer} ->
      assert Euler.Rational.dvn(fraction1, fraction2) == answer
    end
  end
end
